#!/bin/bash
x=$1
while [ $x -le $2 ]
do
  sleep 10
  wget --user-agent="Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.94 Safari/537.36 OPR/37.0.2178.43" "https://www.supermicro.com/support/resources/getfile.aspx?ID=$x"
  x=$(( $x + 1 ))
done
