---
title: "{{ replace .Name "-" " " | title }}"
date: {{ .Date }}
draft: false
type: "gallery"
---

**Insert Lead paragraph here.**

## New Cool Posts

{{ range first 10 ( where .Site.RegularPages "Type" "cool" ) }}
* {{ .Title }}
{{ end }}