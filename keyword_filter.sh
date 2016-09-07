#!/bin/bash

while read p; do
  find "$2" -type f -maxdepth 1 -name "*$p*" -exec bash -c '
    echo -n -e "\033[Kmoving $1\r"
    mv "$1" filter_out/
  ' bash {} \;
done < "$1"