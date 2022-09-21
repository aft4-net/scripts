#! bin/bash

while read line;
do
    segment=${line#\"$2\"}
    if [ $line == $segment ]; then continue
    else break; fi
done < $1
list=()
while read line;
do
    segment=${line%\]}
    if [ ${#line} > ${#segment} ]; then break; fi
    line=${line#*\"}
    list+=${line%\"*}
done
echo "${list[@]}