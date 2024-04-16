# Minimal Hugo Website

Our Hugo One Pager. With this page as content page.

## Directory structure

```text
/zero2hugo/minimal-site
│   hugo.toml              <-- site configuration
│   LICENSE                <-- license file        (not hugo relevant)
│   README.md              <-- README file         (not hugo relevant)
│
├───content
│       index.md           <-- homepage
│
└───layouts
        home.html          <-- homepage layout
```

## File contents

### `/hugo.toml`

```toml
# suppress default creation of additional currently unused content
disableKinds = ['rss', 'sitemap', 'taxonomy', 'term']
```

### `/layouts/home.html`

    In fact the layout in the example section has another line (9) of code for
    displaying the page source on this page. We use a generator, and so it does
    not make sense to manually code the page source. Also this would be quite an
    effort. Just check out the real source file if you are curious.

```html { linenos=table, hl_lines=[8] }
<!DOCTYPE html>
<html lang="en">
   <head>
      <meta charset="utf-8" />
      <title>Zero 2 Hugo</title>
   </head>
   <body>
      {{ .Content }}
   </body>
</html>
```

### `/content/index.md`
