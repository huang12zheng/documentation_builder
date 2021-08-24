import 'dart:io';

import 'package:documentation_builder/builders/template_builder.dart';
import 'package:documentation_builder/generic/documentation_model.dart';
import 'package:documentation_builder/generic/paths.dart';
import 'package:documentation_builder/parser/parser.dart';
import 'package:documentation_builder/parser/tag_attribute_parser.dart';
import 'package:documentation_builder/parser/tag_parser.dart';
import 'package:documentation_builder/project/local_project.dart';
import 'package:fluent_regex/fluent_regex.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  group('class: ImportFileTagRule', () {
    String pathName = 'path';
    String pathValue = 'doc/templates/README.md';
    String invalidPathValue = 'doc\\templates\\README.md';
    String pathAttribute = '$pathName="$pathValue"';
    String invalidPathAttribute = '$pathName="$invalidPathValue"';
    String titleName = 'title';
    String titleValue = '# Title';
    String invalidTitleValue = '';
    String titleAttribute = "  $titleName  : '$titleValue'  ";
    String invalidTitleAttribute = "  $titleName  : '$invalidTitleValue'  ";
    group('field: expression', () {
      test("lowercase tag name has match", () {
        var rule = ImportFileTagRule();
        expect(
            rule.expression
                .hasMatch("{importfile $pathAttribute $titleAttribute}"),
            true);
      });
      test("lowercase and uppercase tag name has match", () {
        var rule = ImportFileTagRule();
        expect(
            rule.expression
                .hasMatch("{ImportFile  $pathAttribute $titleAttribute}"),
            true);
      });
      test("lowercase and uppercase tag name has match", () {
        var rule = ImportFileTagRule();
        expect(
            rule.expression.hasMatch(
                " {  ImportFile  $pathAttribute $titleAttribute    } "),
            true);
      });
    });
    group('class: TagParser', () {
      test('2 valid attributes', () {
        var nodes = TestParser()
            .parse(TestRootNode("{  TestTag $pathAttribute $titleAttribute}"))
            .children;
        Map<String, dynamic> expectedMap = {
          '$pathName': ProjectFilePath(pathValue),
          '$titleName': '$titleValue'
        };
        expect(nodes.length, 1);
        expect(nodes.first is TestTag, true);
        expect((nodes.first as TestTag).attributeNamesAndValues, expectedMap);
      });

      test('missing optional attribute', () {
        var nodes = TestParser()
            .parse(TestRootNode("{  TestTag $pathAttribute }"))
            .children;
        Map<String, dynamic> expectedMap = {
          '$pathName': ProjectFilePath(pathValue),
        };
        expect(nodes.length, 1);
        expect(nodes.first is TestTag, true);
        expect((nodes.first as TestTag).attributeNamesAndValues, expectedMap);
      });

      test('missing required attribute', () {
        var text = "{  TestTag $titleAttribute}";
        expect(
            () => TestParser().parse(TestRootNode(text)),
            throwsA(isA<ParserWarning>().having(
                (e) => e.toString(),
                'toString()',
                equals(
                    "Required path attribute is missing in tag: '$text'."))));
      });

      test('invalid attribute text', () {
        var text = "{  TestTag $pathAttribute 123 $titleAttribute}";
        expect(
            () => TestParser().parse(TestRootNode(text)),
            throwsA(isA<ParserWarning>().having(
                (e) => e.toString(),
                'toString()',
                equals(
                    "'123' could not be parsed to an attribute in tag: '$text'."))));
      });
      test('invalid path value', () {
        var text = "{  TestTag $invalidPathAttribute $titleAttribute}";
        expect(
            () => TestParser().parse(TestRootNode(text)),
            throwsA(isA<ParserWarning>().having(
                (e) => e.toString(),
                'toString()',
                equals(
                    "Invalid ProjectFilePath format: $invalidPathValue in tag: '$text'."))));
      });
      test('invalid title value', () {
        var text = "{  TestTag $pathAttribute $invalidTitleAttribute}";
        expect(
            () => TestParser().parse(TestRootNode(text)),
            throwsA(isA<ParserWarning>().having(
                (e) => e.toString(),
                'toString()',
                equals(
                    "Title may not be empty in tag: '$text'."))));
      });
      test('parse all template files in this project successfully', () {
        TagParser().parse(createModelFromTemplateFiles());
        //should not throw ParserWarnings
      });
    });
  });
}

DocumentationModel createModelFromTemplateFiles() {
  DocumentationModel model = DocumentationModel();

  Directory directory = LocalProject.directory;
  var directorPattern = FluentRegex()
      .startOfLine()
      .literal(directory.path)
      .or([FluentRegex().literal('\\'), FluentRegex().literal('/')]);
  List<String> templateFilePaths = directory
      .listSync(recursive: true)
      .where((FileSystemEntity e) => e.path.toLowerCase().endsWith('.mdt'))
      .map((FileSystemEntity e) =>
          e.path.replaceAll(directorPattern, '').replaceAll('\\', '/'))
      .toList();

  if (templateFilePaths.isEmpty) throw Exception('No template files found!');

  var factories = MarkdownTemplateFactories();
  templateFilePaths.forEach((String sourcePath) {
    try {
      var factory = factories.firstWhere((f) => f.canCreateFor(sourcePath));
      var markdownPage = factory.createMarkdownPage(model, sourcePath);
      model.add(markdownPage);
    } on Error {
      // Continue
    }
  });
  if (model.children.isEmpty) throw Exception('No MarkdownPages created.');
  return model;
}

class TestParser extends Parser {
  TestParser() : super([TestTagRule()]);
}

class TestRootNode extends RootNode {
  TestRootNode(String text) {
    children.add(TextNode(this, text));
  }
}

class TestTagRule extends TagRule {
  TestTagRule()
      : super('testTag', [
          ProjectFilePathAttributeRule(),
          TitleAttributeRule(),
        ]);

  @override
  Tag createTagNode(
          ParentNode parent, Map<String, dynamic> attributeNamesAndValues) =>
      TestTag(parent, attributeNamesAndValues);
}

class TestTag extends Tag {
  final Map<String, dynamic> attributeNamesAndValues;

  TestTag(ParentNode? parent, this.attributeNamesAndValues) : super(parent);
}
