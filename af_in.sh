#! bash

# iter () {
#     if [ $1 == 0 ]; then return 1
#     elif [ $1 == 1 ]; then return 2
# }

root_path="/d/MyApps-Development/scripts"
args=()
i=0
for each in $@; do
    i=`expr $i + 1`
    if [ $i -gt 2 ]; then
        args+=($each)
    fi
    
done

success="y"

if [ $1 == "-b" ]; then root_path="$root_path/commons"
elif [ $1 == "-d" ]; then root_path="$root_path/dotnet"
else success="n"; echo "Invalid script group!"
fi

if [ $success == "y" ]; then eval "bash $root_path/$2.sh ${args[@]}"; fi