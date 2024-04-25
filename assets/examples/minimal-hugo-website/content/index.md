+++
title = "Minimal Hugo Website"
+++

# Minimal Hugo Website

Our Hugo One Pager. With this page as content page.

## Directory structure

As stated before I won't list files that do not belong to the site sources.

```text
/zero2hugo/minimal-site
│   hugo.toml              <-- site configuration
│
├───content
│       index.md           <-- homepage
│
└───layouts
        home.html          <-- homepage layout
```

### `/hugo.toml`

Could be empty if you don't care about warnings when building and additional stuff generated.

{{< showFile "hugo.toml" "toml">}}

### `/layouts/home.html`

{{< showFile "layouts/home.html" "html" >}}

### `/content/index.md`

{{< showFile "content/index.md" "markdown" >}}

## Appendix

I'm lazy, so I wrote a [Hugo Shortcode](https://gohugo.io/content-management/shortcodes/) for adding
a highlighted code block of a file.

For a normal minimal site this is ofc not neccessary.

## `/layout/shortcodes/showFile.html`

{{< showFile "/layouts/shortcodes/showFile.html" "go-template" >}}
