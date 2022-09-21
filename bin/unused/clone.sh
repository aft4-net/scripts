#! bash

alias clone="clone.sh"

cloneRepo () {
    for each in $@; do `git clone $each`; done
}

readTxt () {
    list=()
    for file in $@;
    do
        while read line; do list+=($line); done < $file
    done
    return $list
}

readJson () {
    while read line;
    do
        segment=${line#\"$2\"}
        if [ $line == $segment ]; then continue
        else break; fi
    done
    list=()
    while read line;
    do
        segment=${line%\]}
        if [ ${#line} > ${#segment} ]; then break; fi
        line=${line#*\"}
        list+=${line\"*}
    done
    return list
}

cloneError () {
    if [ $1 > 0 ]; then 
        echo "cmd: 'clone [[[t|l] source1 ...] | [j <json_file> <key_name>]]"
    fi
    
}

# validateRepo () {
#     for each in ${1[@]};
#     do
#         if [ ${each:0:8} != "https://" ]; then continue
#         else `cloneError`; break
#         fi
#     done
# }


if [ ${#2} == 0 ]; then eval "cloneError";
elif [ $1 == "-t" ]; then
    if [ ${#2} == 0 ]; then `cloneError`; fi
elif [ $1 == "-j" ]; then
    if [ ${#3} == 0 ]; then `cloneError`; fi
else
    col=$@
    len=${#col}-1
    col=${col:1:$len}
    if [ $1 == "-t" ]; then col=`readTxt $col`
    elif [ $1 == "-j" ]; then col=`readJson ${col[0]} ${col[1]}`
    fi
    `cloneRepo $col`
fi

