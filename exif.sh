#!/usr/bin/env bash

exiftool -r ${@:1} -w %d%f.%e.json -json -struct \
    -EXIF:All \
    -XMP:Title \
    -Composite:LensSpec
