#!/bin/sh

# Setup file names and paths
NAME=donut
DOODLE=doodle.scad 
SVG=data/${NAME}.svg
STL=data/${NAME}.stl
THREEMF=data/${NAME}.3mf
BIGPNG=data/${NAME}_big.png
PNG=data/${NAME}.png

# Path to the OpenSCAD application
OPENSCAD=/Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD

# Generate STL using OpenSCAD
"$OPENSCAD" -D "filename=\"${SVG}\"" --enable manifold -o "${STL}" "${DOODLE}"

# Generate 3MF using OpenSCAD
"$OPENSCAD" -D "filename=\"${SVG}\"" --enable manifold -o "${THREEMF}" "${DOODLE}"

# Generate a large PNG image using OpenSCAD
"$OPENSCAD" -D "filename=\"${SVG}\"" --projection=perspective --enable=manifold --camera=10,-100,300,0,0,0 --colorscheme=Nature --imgsize=3200,3200 -o "${BIGPNG}" "${DOODLE}"

# Resize the PNG using ImageMagick
magick convert "${BIGPNG}" -resize 25% "${PNG}"

# Remove the large intermediate PNG file
rm "${BIGPNG}"

# Optimize the final PNG using ImageOptim
imageoptim "${PNG}"