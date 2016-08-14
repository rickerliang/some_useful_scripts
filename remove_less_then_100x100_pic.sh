#!/bin/bash
workdir=/tmp/crop_100x100_output_dir
mkdir "$workdir"

# crop 100x100
find $1 -type f -exec bash -c '
  filepath="$1"
  filename=$(basename "$1")
  convert $1 -crop 100x100 "$2/$filename%03d.png"
  echo -n -e "\033[Kcropping $filename\r"
  ' bash {} $workdir \;

cd "$workdir"

# remove edge/remainder
find . -type f -exec bash -c '
  dimesion=$(identify -format %wx%h "$1")
  if [[ "$dimesion" =~ ([0-9]+)x([0-9]+) ]]; then
    width=${BASH_REMATCH[1]}
    height=${BASH_REMATCH[2]}
    if (( $width < 100 )) || (( $height < 100 )); then
      echo -n -e "\033[Kremoving $1\r"
      rm $1
    fi
  fi' bash {} \;
