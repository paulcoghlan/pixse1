#!/usr/bin/env bash

exiftool ${@:1} -w %d%f.%e.json -json -struct \
    -EXIF:All \
    -XMP:Title \
    -Composite:LensSpec
