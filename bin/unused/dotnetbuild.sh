#! bash

# alias rundotnet="rundotnet.sh"

list=()
while read line; do list+=($line); done < $1

for each in ${list[@]}; do
    each=${each#\r}
    echo "Building Solution => $each"
    eval "cd ./$each"
    eval "git pull"
    eval "dotnet build ./$each/src/$each"
    eval "cd .."
done