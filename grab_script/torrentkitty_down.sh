#!/bin/bash
counter=1
x=1

mkdir torrentkitty_temp
cd torrentkitty_temp

wget --output-document=count.txt --user-agent="Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.94 Safari/537.36 OPR/37.0.2178.43" "https://www.torrentkitty.tv/search/$1/"
counter=$(cat count.txt | grep -oPm1 '[0-9]+(?=\<\/a><a href="2">»<\/a><\/div>)')
if [ ! "$counter" ]; then
  counter=1
fi
echo $counter
rm count.txt

while [ $x -le $counter ]
do
  sleep 10
  wget --user-agent="Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.94 Safari/537.36 OPR/37.0.2178.43" "https://www.torrentkitty.tv/search/$1/$x"
  x=$(( $x + 1 ))
done

grep -h -o "magnet:?xt=urn:btih:[^<'\"]*" ./* > ../"$1.txt"

cd ..
rm -rf torrentkitty_temp
