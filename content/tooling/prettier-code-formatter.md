---
title: "Prettier - An Opinionated Code Formatter"
params:
   dependencies: ["nodejs"]
   type: utility
   homepage: "https://prettier.io/"
plugins:
   - prettier-plugin-go-template: https://github.com/NiklasPor/prettier-plugin-go-template#readme
---

# Prettier - An Opinionated Code Formatter

**I use Prettier with the _prettier-plugin-go-template_ which enhances prettier to deal with the go
templates that will otherwise be corrupted at every call. Although Prettier sometimes have different
_opinions_ a fast and reliable \_auto_formatting is worth to change some habits.**

> -  Supports many languages
> -  Integrates with most editors
> -  Has few options

<!--more-->

## Install

Prettier is a npm application so just use `npm` to install to your current workspace folder.

Easiest is to install both Prettier and the Go-Templates plugin to your current workplace[^global]
using npm.

[^global]:

hi

```powershell
npm install --save-dev prettier prettier-plugin-go-template
```

## Usage

Mostly used to autoformat source files in VSCode on save.

## Configuration

To enable the plugin you have to add it to the `.prettierrc`. And ofc you may configure the
formatting to some degree.

Here's my `.prettierrc` for reference:

{{< showFile "/.prettierrc" "json" >}}
