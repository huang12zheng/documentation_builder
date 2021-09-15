[//]: # (This file was generated from: doc/template/README.mdt using the documentation_builder package on: 2021-09-15 07:44:17.161400.)
[![Pub Package](https://img.shields.io/pub/v/documentation_builder)](https://pub.dev/packages/documentation_builder)
[![Code Repository](https://img.shields.io/badge/repository-git%20hub-blue)](https://github.com/efficientyboosters/documentation_builder)
[![Github Wiki](https://img.shields.io/badge/documentation-wiki-blue)](https://github.com/efficientyboosters/documentation_builder/wiki)
[![GitHub Stars](https://img.shields.io/github/stars/efficientyboosters/documentation_builder)](https://github.com/efficientyboosters/documentation_builder/stargazers)
[![GitHub License](https://img.shields.io/badge/license-MIT-blue)](https://github.com/efficientyboosters/documentation_builder/blob/main/LICENSE)
[![GitHub Issues](https://img.shields.io/github/issues/efficientyboosters/documentation_builder)](https://github.com/efficientyboosters/documentation_builder/issues)
[![GitHub Pull Requests](https://img.shields.io/github/issues-pr/efficientyboosters/documentation_builder)](https://github.com/efficientyboosters/documentation_builder/pull)

<a id='documentation-builder'></a>
# documentation_builder
Generates markdown documentation files from markdown template files.
This can be useful when you write documentation for a
[Dart](https://dart.dev/) or [Flutter](https://flutter.dev/) project
and want to reuse/import Dart code or Dart documentation comments.

It can generate the following files:
- README.md file
- CHANGELOG.mdt file
- example.md file
- Github Wiki pages (also markdown files)

[documentation_builder](https://pub.dev/packages/documentation_builder) is not intended to generate API documentation.
Use [dartdoc](https://dart.dev/tools/dartdoc) instead.


<a id='examples'></a>
## Examples
The [DocumentationBuilder](https://github.com/efficientyboosters/documentation_builder/wiki/01-Documentation-Builder#lib-builder-documentation-builder-dart-documentationbuilder)s own documentation was generated by itself and also serves as show case.

You can view the templates files and the generated output on https://github.com and https://pub.dev:

- README
  - [Markdown Template File](https://raw.githubusercontent.com/efficientyboosters/documentation_builder/main/doc/template/README.mdt)
  - [Generated Markdown File Raw](https://raw.githubusercontent.com/efficientyboosters/documentation_builder/main/README.md)
  - [Generated Markdown File Rendered](https://pub.dev/packages/documentation_builder)
- CHANGELOG
  - TODO (GitHubRaw suffix='/main/doc/template/CHANGELOG.mdt' title='Markdown Template File']
  - TODO (GitHubRaw suffix='/main/CHANGELOG.md' title='Generated Markdown File Raw']
  - [Generated Markdown Rendered](https://pub.dev/packages/documentation_builder/versions)
- Wiki pages
  - [Markdown Template Files](https://github.com/efficientyboosters/documentation_builder/tree/main/doc/template) (select a file and select raw to see the source)
  - [Generated Markdown Files Raw](https://github.com/efficientyboosters/documentation_builder/tree/main/doc/wiki) (select a file and select raw to see the source)
  - [Generated Markdown Files Rendered](https://github.com/efficientyboosters/documentation_builder/wiki)
- example
  - [Markdown Template File](https://raw.githubusercontent.com/efficientyboosters/documentation_builder/main/doc/template/example.mdt)
  - [Generated Markdown File Raw](https://raw.githubusercontent.com/efficientyboosters/documentation_builder/main/example/example.md)
  - [Generated Markdown Page Rendered](https://pub.dev/packages/documentation_builder/example)

<a id='getting-started'></a>
## Getting Started
- Read the [Wiki documentation](https://github.com/efficientyboosters/documentation_builder/wiki)
- [Install the documentation_builder package](https://pub.dev/packages/documentation_builder/install) in your project
- Create 'doc/template' directories in the root of your project
- [Create markdown template files](https://github.com/efficientyboosters/documentation_builder/wiki/02-Markdown-Template-Files) in the "doc/template" directory ([see examples](https://github.com/efficientyboosters/documentation_builder/wiki/06-Examples))
- [Generate the documentation files](https://github.com/efficientyboosters/documentation_builder/wiki/05-Generating-Documentation-Files)