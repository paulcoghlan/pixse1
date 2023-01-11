---
title: "About This Theme"
date: 2022-10-30T18:52:53Z
draft: false
type: "post"
---

## Intro

- Hugo Theme [fork](https://github.com/paulcoghlan/hugo-theme-hello-friend) of https://github.com/panr/hugo-theme-hello-friend tailored towards hosting collections of photo galleries.
- Adds two content types:
  - `gallery` - a set of images in directory
  - `collection` - group of galleries to be used as primary navigation
- The theme allows you to turn a hierarchy of photo directories into a static website with the aid of an
[import tool](https://github.com/paulcoghlan/hugo-gallery).
- Note this theme isn't intended to be for portfolio or blog sites, it more about making it easy to manage a large number of photo galleries.
- Gallery component is based on https://www.lightgalleryjs.com/ lightbox and https://miromannino.github.io/Justified-Gallery/ for the layout.
- Gallery posts may be hidden from navigation with the `browseable: false` property - [example]({{< ref "gallery/personal" >}}).
- Galleries have a thumbnail slideshow (click on an image) and a distraction-free presentation mode (icon on heading - for TVs etc).

Inspired by this blog post: https://blog.cavelab.dev/2021/04/photo-gallery-posts/

## How it works

- Multiple images are stored in a gallery.  
- Galleries may be arranged hierarchically to aid navigation.
- Galleries have a `cover` image which is used to represent the gallery in the navigation.

The content is organized in the following way:

```
content
└── gallery <-- section
    |
    ├── collection-a
    |   |
    │   ├── gallery-1
    |   |   ├─- index.md 'leaf-bundle' <-- gallery content type index page - see https://gohugo.io/content-management/page-bundles/#fn:1
    │   |   ├── image1.jpg
    │   |   └── image2.jpg
    |   |
    |   └-- gallery-2
    │       ├── image1.jpg
    │       └── image2.jpg
    |
    ├── collection-b
    |   |
    │   ├── gallery-3
    |   |   ├─- index.md 
    │   |   ├── image1.jpg
    │   |   └── image2.jpg
    |   |
    |   └-- gallery-4
    │       ├── image1.jpg
    │       └── image2.jpg
    |
    ├-- collection-a.md  <-- collection content type index page
    ├-- collection-b.md
    | 
    └-- _index.md 'branch-bundle' <-- collection index page - see https://gohugo.io/content-management/page-bundles/#fn:1
```

For example, see the content directory for this site at: https://github.com/paulcoghlan/pixse1/tree/main/content.

### `collection` content type

Example:

```
---
title: "2021"
date: 2022-11-10T21:01:54Z
draft: false
type: "collection"
cover: "images/eric-muhr-7S5n1QlPGSM-unsplash.jpg"
---
```

`cover` selects an image in the `assets` directory (bit of a hack, couldn't read the leaf-bundles) which is used for navigation.

### `gallery` content type

Example:

```
---
title: France Trip
date: "2021-06-12"
type: "gallery"
cover: "image1.jpg"
tags: ['travel', 'france']
---
```

`cover` selects an image in the leaf page bundle.
