#!/bin/bash
# 假设目录结构
# working/
#        .git/
#        coding/
# $1 input xml file name
git_user_name=$(git config user.name)
# 捕捉xml内file路径，到coding层
origin_coding_dir=$(cat $1 -v |  grep -oPm1 "(?<=<error file=\").+(?=\" line=\")" | grep -ioP ".+coding")
origin_coding_dir=${origin_coding_dir//\\/\\\\}
# 替换为./, 例如./api/etapi/kde/kkdeservice.h
replace_coding_dir="."
replace_coding_dir=${replace_coding_dir//\\/\\\\}
echo "git user name $git_user_name"

# 替换为./，例如./api/etapi/kde/kkdeservice.h
sed "s/$origin_coding_dir/$replace_coding_dir/g" $1 > __tmp1.xml
# 针对window的路径斜杠
sed 's/\\/\//g' __tmp1.xml > __tmp2.xml
sort __tmp2.xml > __tmp3.xml

#shopt -s nocaseglob
#match_any=*
cd ./coding
while read p; do
  # 捕捉xml文件内，file路径、line行号、msg错误提示
  if [[ "'$p'" =~ (error file=\")([^\"]+)(\" line=\")([0-9]+)([[:print:]]+\" msg=\")([[:print:]]+) ]]; then
    file_name=${BASH_REMATCH[2]}
    
    #file_name=$(ls ${BASH_REMATCH[2]}$match_any)
    #echo $file_name
    
    file_line=${BASH_REMATCH[4]}
    err_msg=${BASH_REMATCH[6]}
    # git blame
    blame_content=$(git blame -f -L$file_line,+1 $file_name)
    # 连接一下blame的结果和msg错误信息
    echo "$blame_content $err_msg"
    fi
done < ../__tmp3.xml
cd ..
rm __tmp1.xml __tmp2.xml __tmp3.xml