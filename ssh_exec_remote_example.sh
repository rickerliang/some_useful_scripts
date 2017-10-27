ssh username@ser.ver ARG1="09876" ARG2="POIUY" 'bash -s' << 'ENDSSH'
  echo $ARG1 $ARG2 > /tmp/test.txt
  echo ${ARG1}-${ARG2} >> /tmp/test.txt
  nname1="abcdefg" 
  nname2="1234" 
  echo $nname1 >> /tmp/test.txt
  echo ${nname1}-${nname2} >> /tmp/test.txt
ENDSSH
