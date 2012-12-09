#!/bin/bash
# Convert all svg vector images to rasterized png images.
# This script is using qlmanage and convert. It only works on a mac, but it seems to produce the best quality renderings.

for file in *.svg
do
	echo "$file"
	qlmanage -t -s 500 -o . "$file"
	convert "$file.png" -crop 500x400+0+0 "$file.png"
done	

