---
title: "Prettier - An Opinionated Code Formatter"
params:
   dependencies: ["node.js"]
   type: utility
   homepage: "https://prettier.io/"
plugins:
   - "prettier-plugin-go-template: https://github.com/NiklasPor/prettier-plugin-go-template#readme"
---

# Prettier - An Opinionated Code Formatter

**Automatic code formatting from editor and command line.**

> -  Supports many languages
> -  Integrates with most editors
> -  Has few options

<!--more-->

Sometimes Prettier has a different _opinions_ about code should be formatted than we do, But a
fast,consistent and reliable formatting is worth it.

We use Prettier with the _prettier-plugin-go-template_ which handles the go templates that will
otherwise be corrupted.

## Install

Prettier is a npm application so just use `npm` to install to your current workspace folder.

Easiest is to install both Prettier and the Go-Templates plugin to your current workplace[^global]
using npm.

[^global]: could't make it with a _--global_ install

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
