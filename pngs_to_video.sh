#!/bin/bash
ffmpeg -framerate $3 -pattern_type glob -i '*.png' -c:v libx264 -pix_fmt yuv420p -s $2 $1
