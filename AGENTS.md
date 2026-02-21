# AGENTS.md — context for AI coding agents

Hugo static site for a personal photo collection of family and friends. 

Uses a custom fork of `hugo-theme-hello-friend` (in `themes/hello-friend`) with gallery and collection support. Content is versioned with DVC; large binaries live outside git.

## Dev environment tips

- **Preview:** From repo root run `hugo server`.
- **Build:** Run `hugo`; output goes to `public/`.
- **Smaller content set:** In `config.toml` set `contentDir = "content-debug"` to use the debug content tree.
- **Theme assets:** From `themes/hello-friend` run `yarn dev` or `yarn build` for webpack.
- **Full content:** Run `dvc pull` first; `content/` is tracked via `content.dvc`.

## Content conventions

- Galleries live under `content/gallery/<year>/<gallery-name>/`.
- Each gallery has an `index.md` plus JPEGs in the same directory.
- Gallery `index.md` front matter:

```yaml
---
title: "Gallery Title"
date: "YYYY-MM-DD"
type: "gallery"
cover: "cover-image.jpg"
tags: ['tag1', 'tag2']
---
```

- `cover` is a filename in that directory. `date` is YYYY-MM-DD.
- **Tags:** Use tags from the existing set as suggestions: `aussies`, `beaches`, `birthday`, `camping`, `christmas`, `coffeemachines`, `easter`, `england`, `family`, `festival`, `france`, `freddie`, `friends`, `greece`, `holiday`, `italy`, `kayfest`, `kent`, `lila`, `london`, `misc`, `music`, `newyear`, `pasta`, `pets`, `portugal`, `primary`, `riviera`, `school`, `seaside`, `skiing`, `spain`, `st_lucia`, `uk`, `usa`, `wedding`, `xmas`, `yorkshire`
- You can ignore the section at `content/lilaandfreddie/`

## Theme and tooling

- Theme source: `themes/hello-friend`; submodule at `themes/hugo-theme-hello-friend`.
- Gallery import tool: [hugo-gallery](https://github.com/paulcoghlan/hugo-gallery).
- EXIF: enabled in `config.toml` under `[imaging.exif]`; `exif.sh` for extraction.

## Key files

- `config.toml` — Hugo config: `contentDir`, theme, EXIF, menus.
- `archetypes/` — Default front matter for new content.
- `themes/hello-friend/COMMUNITY-FEATURES.md` — Gallery/collection feature notes.
