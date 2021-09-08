[//]: # (This file was generated from: doc/templates/README.mdt using the documentation_builder package on: 2021-09-08 14:21:59.512203.)
[![Pub Package](https://img.shields.io/pub/v/fluent_regex)](https://pub.dev/packages/fluent_regex)
[![Code Repository](https://img.shields.io/badge/repository-git%20hub-blue)](https://github.com/efficientyboosters/documentation_builder)
[![Github Wiki](https://img.shields.io/badge/documentation-wiki-blue)](https://github.com/efficientyboosters/documentation_builder/wiki)
[![GitHub Stars](https://img.shields.io/github/stars/efficientyboosters/documentation_builder)](https://github.com/efficientyboosters/documentation_builder/stargazers)
[![GitHub License](https://img.shields.io/badge/license-MIT-blue)](https://github.com/efficientyboosters/documentation_builder/blob/main/LICENSE)
[![GitHub Issues](https://img.shields.io/github/issues/efficientyboosters/documentation_builder)](https://github.com/efficientyboosters/documentation_builder/issues)
[![GitHub Pull Requests](https://img.shields.io/github/issues-pr/efficientyboosters/documentation_builder)](https://github.com/efficientyboosters/documentation_builder/pull)

<a id='documentation-builder'></a>
# documentation_builder
Generates markdown documentation files from markdown template files.
This can be useful when you write documentation for a Dart or Flutter project
and want to reuse/import Dart code or Dart documentation comments.

It can generate the following files:
- README.md file
- CHANGELOG.mdt file
- example.md file
- Github Wiki pages (also markdown files)

[documentation_builder] is not intended to generate API documentation.
Use [dartdoc](https://dart.dev/tools/dartdoc) instead.


<a id='examples'></a>
## Examples
The [DocumentationBuilder]s own documentation was generated by itself and also serves as show case.

You can view the templates files and the generated output on https://github.com and https://pub.dev:

- README
  - [Markdown Template File](https://raw.githubusercontent.com/efficientyboosters/documentation_builder/main/doc/templates/README.mdt)
  - [Generated Markdown File Raw](https://raw.githubusercontent.com/efficientyboosters/documentation_builder/main/README.md)
  - [PubDev title='Generated Markdown File Rendered']
- CHANGELOG
  - [Markdown Template File](https://raw.githubusercontent.com/efficientyboosters/documentation_builder/main/doc/templates/CHANGELOG.mdt)
  - [Generated Markdown File Raw](https://raw.githubusercontent.com/efficientyboosters/documentation_builder/main/CHANGELOG.md)
  - [PubDevProjectVersions title='Generated Markdown Rendered']
- Wiki pages
  - [Markdown Template Files](https://github.com/efficientyboosters/documentation_builder/tree/main/doc/templates)
  - [Generated Markdown Files](https://github.com/efficientyboosters/documentation_builder/tree/main/doc/wiki) (select raw to see source)
  - [Generated Markdown Files Rendered](https://github.com/efficientyboosters/documentation_builder/wiki)
- example
  - [Markdown Template File](https://raw.githubusercontent.com/efficientyboosters/documentation_builder/main/doc/templates/example.mdt)
  - [Generated Markdown File Raw](https://raw.githubusercontent.com/efficientyboosters/documentation_builder/main/example/example.md)
  - [PubDev title='Generated Markdown Page Rendered']

<a id='getting-started'></a>
## Getting Started
- Read the [Wiki documentation](https://github.com/efficientyboosters/documentation_builder/wiki)
- [PubDevInstall title='Install the documentation_builder package'] in your project
- Create 'doc/templates' directories in the root of your project
- [02-Markdown-Template-Files.mdt title='Create markdown template files'] in the "doc/templates" directory ([06-Examples.mdt title='see examples'])
- [05-Generating-Documentation-Files.mdt title='Generate the documentation files']