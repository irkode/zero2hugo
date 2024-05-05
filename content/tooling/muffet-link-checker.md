---
title: "Muffet - Fast Website Link Checker in Go"
params:
   name:
   dependencies: []
   type: utility
   homepage: https://github.com/raviqqe/muffet
   download: https://github.com/raviqqe/muffet/releases
---

# Muffet - Fast Website Link Checker in Go

**Test for broken links on the generated website.**

> Muffet is a website link checker which scrapes and inspects all pages in a website recursively.

<!--more-->

## Installation

[Download a release package](https://github.com/raviqqe/muffet/releases) and place the executable
somewhere in your PATH.

If you have go installed you may use:

```bash
go install github.com/raviqqe/muffet/v2@latest
```

## Usage

```bash
hugo server
muffet http://localhost:1313/
```

## Configuration

To increase the read buffer size in case you get errors like that one use `-b SIZE`. Just play
around to find the size you need.

<!-- cspell:disable -->

> ```text
> error when reading response headers: small read buffer. **Increase ReadBufferSize. Buffer
> size=4096**, contents: "HTTP/1.1 200 OK\r\nServer: GitHub.com\r\nDate: Wed, 01 May 2024 07:34:16
> GMT\r\nContent-Type: text/html; charset=utf-8\r\nVary: X-PJAX, X-PJAX-Container, Turbo-Visit,
> Turbo-Frame, Accept-Encoding, Accept, X-R"..."ax\r\nSet-Cookie: logged_in=no; Path=/;
> Domain=github.com; Expires=Thu, 01 May 2025 07:34:17 GMT; HttpOnly; Secure;
> SameSite=Lax\r\nAccept-Ranges: bytes\r\nTransfer-Encoding: chunked\r\nX-GitHub-Request-Id: D"
> https://github.com/raviqqe/muffet
> ```

<!-- cspell:enable -->
