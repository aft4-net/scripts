
#! bin/bash

# alias "clone"

#! bin/bash

# notNone="-n"

# notFiles="-f"
# notStarts="-s"
# notEnds="-e"

# notlist=($notFiles $notStarts $notEnds)

# files=()
# starts=()
# ends=()

# lists=""

# checkPattern () {
#     text=$1
#     patterns=()
#     i=0
#     for arg in $@; do
#         if [ i == 0 ]; then continue; fi
#         segment=${text#*$arg*}
#         if [ ${#text} == ${#segment} ]; then continue
#         else return 1
#         fi
#         i=`expr $i+1`
#     done
#     return 0
# }

# checkNot () {
#     res=$notNone
#     for not in ${notlist[@]}; do
#         if [ $not == $1 ]; then res=$not; fi
#     done
#     echo "$res"
# }

# appendData () {
#     not=$1
#     value=$2
#     if [ $not == $notFiles ]; then files+=($value)
#     elif [ $not == $notStarts ]; then starts+=($value)
#     elif [ $not == $notEnds ]; then ends+=($value)
#     fi
#     # Error
# }

# reader () {
#     $file=$1
#     if [ ${#starts} > 0 ]; then
#         while read line; do
#             if [ ${#line} == 0 ]; then continue; fi
#             fits=`checkPattern $line ${starts[@]}`
#             if [ $fits == 1 ]; then break; fi
#         done < $file
#     fi
#     list=()
#     if [ ${#ends} > 0 ]; then
#         while read line; do
#             if [ ${#line} == 0 ]; then continue; fi
#             fits=`checkPattern $line ${ends[@]}`
#             if [ $fits == 1 ]; then break; fi
#             list+=($line)
#         done < $file
#     fi
# }

all=""
while read line; do
    line=${line#\r}
    all="$all $line"
    lists+=($line)
    # echo $line
done < $1


# current='-f' # -f -> files, -s -> starts, -e -> ends

# for arg in $@; do
#     not=`checkNot $arg`
#     not=${not#$notNone}
#     if [ ${#not} == 0 ]; then `appendData $current $arg`
#     else current=$not
#     fi
# done

# starts=()
# ends=()
# for file in ${files[@]}; do
#     `reader $file`
# done
echo $all
echo ${lists[@]}