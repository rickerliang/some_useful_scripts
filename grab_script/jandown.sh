#!/bin/bash

echo "" > error.log

while read p; do
  if [[ "'$p'" =~ ref=([A-Za-z0-9]{10}) ]]; then
    echo "${BASH_REMATCH[1]}"
    code_serial=${BASH_REMATCH[1]}
    curl 'http://www.jandown.com/fetch.php' -H 'Cookie: __cfduid=d5125d8e070b40f126e9a4d668047e1761442046129; __utma=75495433.1095379596.1387002328.1443274027.1444576453.92' -H 'Origin: http://www.jandown.com' -H 'Accept-Encoding: gzip, deflate' -H 'Accept-Language: zh-CN,zh;q=0.8,en;q=0.6,ja;q=0.4,ru;q=0.2,zh-TW;q=0.2' -H 'Upgrade-Insecure-Requests: 1' -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36' -H 'Content-Type: multipart/form-data; boundary=----WebKitFormBoundaryxj9HApqGbUYZDuqp' -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8' -H 'Cache-Control: max-age=0' -H "'Referer: http://www.jandown.com/link.php?ref=$code_serial'" -H 'Connection: keep-alive' --data-binary $'------WebKitFormBoundaryxj9HApqGbUYZDuqp\r\nContent-Disposition: form-data; name=\"code\"\r\n\r\n'$code_serial$'\r\n------WebKitFormBoundaryxj9HApqGbUYZDuqp--\r\n' --compressed -o "$code_serial.torrent" -m 60 --retry 3 --retry-delay 10
    if [ $? -eq 0 ]
    then
      echo "download $code_serial success"
    else
      echo "download $code_serial fail"
      echo "$code_serial" >> error.log
    fi
    sleep 10
  fi
done < $1
cat error.log
