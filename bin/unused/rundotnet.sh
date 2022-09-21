#! bash

# alias rundotnet="rundotnet.sh"

list=()
while read line; do list+=($line); done < $1

for each in ${list[@]}; do
    echo "Building Solution => $each"
    eval "cd ./$each"
    eval "git pull"
    eval "cd .."
    eval "dotnet build ./$each"
done