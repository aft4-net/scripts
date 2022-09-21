#! bash

root=""
type=""
mode=""
folder=""
projs=()

inputtype=""

result=""

append () {
    if [$1 == "n" && $3 != "" ]; then echo "Err#Trying to append $3 to $4"
    elif [$1 == "n" ]; then echo $3
    elif [ ${#4} == "0" ]; then echo $3
    else echo "$4$2$3"
    fi
}

for each in $@; do
    if [ ${each:0:1} == "-" ]; then inputtype="$each"
    elif [ $inputtype == "-r" ]; then  root="$root.$each" #root="$root.append y "." $each $root`#; result=$root
    elif [ $inputtype == "-t" ]; then  type="$each" #type=`append n "-" $each $type`#; result=$type
    elif [ $inputtype == "-m" ]; then  mode="$each" #mode=`append n "-" $each $mode`#; result=$mode
    elif [ $inputtype == "-f" ]; then  folder="$folder/$each" #folder=`append y "/" $each $folder`#; result=$folder
    elif [ $inputtype == "-p" ]; then  projs+=("$each") #proj=`append n "/" $each`; projs+=($proj)#; result=$proj
    else break #result="Err#Unknown marker $inputtype"
    fi
    # val=${result#Err\#}
    # if [ ${#result} > 4 ]; then
    #     if [ ${result:0:4} == "Err#" ]; then
    #         echo "`\t`Error:`\n\t\t`${result:4}"
    #         break
    #     fi
    # fi
done

root=${root#*.}
folder=${folder#*/}
echo "Root: $root"
echo "type: $type"
echo "mode: $mode"
echo "folder: $folder"
echo "projects: ${projs[@]}"

for proj in ${projs[@]}; do
    eval "coreproj.sh $root $type $mode $folder/$proj"
done
