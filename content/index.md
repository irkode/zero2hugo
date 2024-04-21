# Minimal hugo site

Following Hugo [Quick start](https://gohugo.io/getting-started/quick-start/) you
will get a site with example content and theme. This site already has a post
like structure.

I start from scratch here with the subset I need to get my first site generated.

I prepared a repository with two files (commonly added to a repository)

-  LICENSE contains the license terms of the repoistory
-  README.md contains the repository introducution for users

These files will not have any impact on the site generation. I'll hide these
files when listing folder contents. Just ignore their existence.[^dotgit]

[^dotgit]:
    there are some more files inside that I won't list up. These are _Git_
    related or belong to the toolchain I use.

```text
/zero2hugo
    LICENSE      <-- MIT license file
    README.md    <-- repository started page
```

By reading
[Directory structure](https://gohugo.io/getting-started/directory-structure/) I
know that content sources have to be in `/content` folder. So I put this first
file there and per convention I name it index.md - which I hope will be
converted to the generated site as `index.html`.

Now I use the [hugo command](https://gohugo.io/getting-started/usage/) to guide
me through the setup by trying to generate the site.

> `hugo`
>
> ```text
> Total in 0 ms
> Error: Unable to locate config file or config directory. Perhaps you need to create a new site.
> Run `hugo help new` for details.
> ```

So it complains about a missing
[config file](https://gohugo.io/getting-started/configuration/#configuration-file)
and tells where to get assistance.

For a bare starter an empty file is enough. Let's create `/hugo.toml` and
restart

> `hugo`
>
> ```text
> Start building sites …
> hugo v0.124.1-db083b05f16c945fec04f745f0ca8640560cf1ec+extended windows/amd64 BuildDate=2024-03-20T11:40:10Z VendorInfo=gohugoio
>
> WARN  found no layout file for "html" for kind "home": You should create a template file > which matches Hugo Layouts Lookup Rules for this combination.
> WARN  found no layout file for "html" for kind "taxonomy": You should create a template > file which matches Hugo Layouts Lookup Rules for this combination.
>
>                    | EN
> -------------------+-----
>   Pages            |  4
>   Paginator pages  |  0
>   Non-page files   |  0
>   Static files     |  0
>   Processed images |  0
>   Aliases          |  0
>   Cleaned          |  0
>
> Total in 8 ms
> ```

Oh, just one content source but 4 pages generated. Default destination folder
for a hugo generated site is `/public`. Let's check that out.

```text
/zero2hugo/public
│   index.xml
│   sitemap.xml
│
├───categories
│       index.xml
│
└───tags
        index.xml

```

Four Xml files generated but no html file. The Xml files are
[sitemap](https://gohugo.io/templates/sitemap-template/) and
[RSS feeds](https://gohugo.io/templates/rss/#configuration) generated by Hugo by
default. We have no use of that for our bare site.

Additionally there are warnings of missing layouts for some _kind_ of pages.

-  Warning for [Taxonomies](https://gohugo.io/content-management/taxonomies/)
   which we will not use for now. Hugo allows us to disable the generation of
   unwanted default content creation in main config file.

-  warning for [Home](https://gohugo.io/templates/homepage/). This seems to be
   related to our homepage file. So I have to definitely take care of that.

> `/hugo.toml`
>
> ```toml
> disableKinds = ['rss', 'sitemap', 'taxonomy', 'term']
> ```

## The homepage template

Hugo uses [Templates](https://gohugo.io/templates/) to define the target content
for generated pages. To be able to utilize that properly you won't come around
with studying the documentation in depth. Lot's of issues raised to the
[discourse community](https://discourse.gohugo.io/) are related to difficulties
in getting that right.

I just want to get my homepage generated, so I choose the most descriptive name
form [Template lookup order -
HomePage]https://gohugo.io/templates/lookup-order/#home-page. I want to generate
HTML, so my homepage template will be `/layouts/home.html`

Next I use Hugo's [Template language](https://gohugo.io/templates/introduction/)
to tell that I wan't to add the content of the homepage source to the target
page. Line 8 adds the converted content of the source file to the template.

Of course beyond adding the converted markdown text, templates have to create
valid target type files. In my case - generating html - I have to wrap the
generated in some html tags to form a valid HTML5 file:

> `/layouts/home.html`
>
> ```html {linenos=table,hl_lines=8}
> <!DOCTYPE html>
> <html lang="en">
>    <head>
>       <meta charset="utf-8" />
>       <title>Zero 2 Hugo</title>
>    </head>
>    <body>
>       {{ .Content }}
>    </body>
> </html>
> ```

So I now have:

```text
/zero2hugo
│   .hugo_build.lock    <-- don't touch - hugo internal
│   hugo.toml           <-- configuration
│
├───content
│       index.md        <-- homepage (this pages source)
│
└───layouts
        home.html       <-- layout template for the homepage
```

Now regenerate the site.

> `hugo`
>
> ```text
> Start building sites …
> hugo v0.124.1-db083b05f16c945fec04f745f0ca8640560cf1ec+extended windows/amd64 BuildDate=2024-03-20T11:40:10Z VendorInfo=gohugoio
>
>                    | EN
> -------------------+-----
>   Pages            |  1
>   Paginator pages  |  0
>   Non-page files   |  0
>   Static files     |  0
>   Processed images |  0
>   Aliases          |  0
>   Cleaned          |  0
>
> Total in 11 ms
> ```

Voila one page generated and checking out the destination folder I find:

```text
/zero2hugo/public
    index.html
```

## Time to fire up the development server

> `hugo server`
>
> ```text
> Watching for changes in C:\_repos\github\Irkode\zero2hugo\{content,layouts}
> Watching for config changes in C:\_repos\github\Irkode\zero2hugo\hugo.toml
> Start building sites …
> hugo v0.124.1-db083b05f16c945fec04f745f0ca8640560cf1ec+extended windows/amd64 BuildDate=2024-03-20T11:40:10Z VendorInfo=gohugoio
>
>                    | EN
> -------------------+-----
>   Pages            |  1
>   Paginator pages  |  0
>   Non-page files   |  0
>   Static files     |  0
>   Processed images |  0
>   Aliases          |  0
>   Cleaned          |  0
>
> Built in 5 ms
> Environment: "development"
> Serving pages from disk
> Running in Fast Render Mode. For full rebuilds on change: hugo server --disableFastRender
> Web Server is available at //localhost:1313/ (bind address 127.0.0.1)
> Press Ctrl+C to stop
> ```

and preview the site

{{< figure src="minimal-site.png" width="50%">}}

## Ramp up

All you need to publish a one pager using Hugo is:

-  config file: `/hugo.toml`

   if you don't care of the warnings and additional stuff created it may even be
   empty

-  home page layout `/layouts/home.html`

   a simple HTML skeleton for the page layout that adds the converted Markdown
   using `{{ .Content }}`

-  page content: `/content/index.html`

   Markdown content file for the page.

[^pagesource]: