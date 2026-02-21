---
name: new-collection
description: Create a new photo gallery index.md with sensible defaults based on images in the directory
argument-hint: "[directory-path]"
disable-model-invocation: true
allowed-tools:
  - Bash
  - Glob
  - Read
  - Write
---

Create a new photo gallery `index.md` for the directory specified by `$ARGUMENTS`.

If no argument is provided, ask the user which directory to use.

## Steps

1. **Resolve the directory.** If the path is relative, resolve it relative to `/Volumes/Data/pixse1/content/gallery/`. Confirm the directory exists.

2. **Check for existing index.md.** If one already exists, warn the user and stop (do not overwrite).

3. **Scan images.** List all `.jpg` and `.jpeg` files in the directory (case-insensitive). If none are found, tell the user and stop.

4. **Pick a cover image.** Use the first image alphabetically as the default cover.

5. **Determine the date.** Try to extract the date from EXIF metadata of the cover image using:
   ```
   exiftool -DateTimeOriginal -s3 <cover-image>
   ```
   If exiftool is unavailable or returns no date, fall back to the file modification date of the earliest image. Format as `YYYY-MM-DD`.

6. **Derive the title.** Convert the directory name to title case, replacing hyphens and underscores with spaces (e.g., `easter-2025` becomes `Easter 2025`).

7. **Suggest tags.** Match the directory name and title against the existing tag set and include any that match: `aussies`, `beaches`, `birthday`, `camping`, `christmas`, `coffeemachines`, `easter`, `england`, `family`, `festival`, `france`, `freddie`, `friends`, `greece`, `holiday`, `italy`, `kayfest`, `kent`, `lila`, `london`, `misc`, `music`, `newyear`, `pasta`, `pets`, `portugal`, `primary`, `riviera`, `school`, `seaside`, `skiing`, `spain`, `st_lucia`, `uk`, `usa`, `wedding`, `xmas`, `yorkshire`.

8. **Write index.md.** Create the file — no body text, just frontmatter:

```yaml
---
title: "<title>"
date: "<YYYY-MM-DD>"
type: "gallery"
cover: "<cover-filename>"
tags: ['<tag1>', '<tag2>']
---
```

9. **Report.** Show the user a brief summary: path created, image count, cover, date, and tags. Mention they can edit the file to change the cover or add a description.
