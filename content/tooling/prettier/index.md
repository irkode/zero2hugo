+++
title = "Prettier"
+++

# Prettier - Code formatting

from [prettier-plugin-go-template](https://www.npmjs.com/package/prettier-plugin-go-template)

## install

```
npm install --save-dev prettier prettier-plugin-go-template
```

## configure for html

```json
{
  "plugins": ["prettier-plugin-go-template"],
  "printWidth": 100,
  "overrides": [
    {
      "files": ".prettierrc",
      "options": {
        "parser": "json",
        "semi": true,
        "tabWidth": 3
      }
    },
    {
      "files": "*.html",
      "options": {
        "parser": "go-template",
        "tabWidth": 3
      }
    },
    {
      "files": "*.md",
      "options": {
        "parser": "markdown",
        "proseWrap": "always"
      }
    }
  ]
}
```
