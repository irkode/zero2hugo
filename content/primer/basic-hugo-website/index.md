---
title: "Basic Hugo Website"
weight: 20
---

# Create a Basic Hugo Website

In the previous chapter we generated a [Bare Metal Website](/primer/bare-metal-website). Now we will
turn that into a more _Hugo_ like site by adding common configuration and layout templates. This
will give you a good starter for own Hugo projects from Scratch. chapters.

<!--more-->

## The config file

The minimal _Hugo_ configuration as described in
[Configure Hugo](https://gohugo.io/getting-started/configuration/#configuration-file) contains three
attributes:

-  BaseUrl - the deployment root for your website

   Hugo uses this to _convert_ link destinations in your source files to web addresses for your
   deployed website. So you should always provide a value here. This depends on the deployment
   target url of your site. Add a trailing slash to the Url _always_.

   -  deploy to root : `https://www.example.com/`
   -  deploy to subfolder `_https://www.example.com/subfolder/`

   Hugo's development server will respect the subfolder to ensure your links will properly rendered
   on your deployment target.

-  Language Code

   As you've seen in our bare-metal layout template, we specified the language for the HTML file.
   Defining the [language code](https://gohugo.io/getting-started/configuration/#languagecode)
   configuration allows us to develop our templates without language binding for general reuse.
   Internally Hugo will also use that with it's internal templates for the same reason.

-  Site Title

   Usually every website has a prominent Title for the user to easily identify the page when
   bookmarked. Hugo for example has "_The world’s fastest framework for building websites_"

Putting that altogether, including the setting from previous chapter, we get:

> ```toml
> # deploy to root
> baseURL = "https://www.example.com/"
> # could use "en-US" here as well
> languageCode = "en"
> # Website title
> title = "Basic Hugo Website"
> ```

## The Lay
