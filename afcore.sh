#! bash/bin

read -p "Number of Solution Folders: " qty

createFolders () {
    namespaces=()
    `mkdir $1`
    read -p "Type of '$1' (p-project/*-solution) : " type
    if [ $type == "p" ]; then namespaces+=($1)
    else
        read -p "Namespaces: " folders
        for folder in $folders; do
            namespaces+=(`createFolders $1.$folder`)
        done
    fi
    echo ${namespaces[@]}
}

type=$1
location=$2



read -p "ParentNamespace" parent
list=`createFolders $parent`
echo "Solution Folders: ${list[@]}"
