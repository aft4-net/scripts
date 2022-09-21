#! bash

root=$1
type=$2
mode=$3
path=$4

proj=`naming.sh $path`
if [ $mode == "test" ]; then proj="Test.$proj"; fi
dotnet new $type -o $mode/$path -n $root.$proj
dotnet sln add $"./"$mode/$path/$root.$proj.csproj -s "$(tr '.' '/' <<< ${proj%.*})"