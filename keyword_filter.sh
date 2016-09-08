#!/bin/bash

mkdir -p filter_out

while read p; do
  find "$2" -type f -maxdepth 1 -name "*$p*" -exec bash -c '
    echo -n -e "\033[Kmoving $1\r"
    mkdir -p "filter_out/$2"
    mv "$1" "filter_out/$2"
  ' bash {} "$p" \;
done < "$1"
