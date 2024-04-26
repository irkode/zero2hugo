---
title: "{{ replace .File.ContentBaseName `-` ` ` | title }}"
date: "{{- time.Now().UTC() -}}"
---
