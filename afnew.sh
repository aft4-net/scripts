#! bash

# XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
# functions - begin

# ====================================
# donet core - begin

gotoFolder () {
    read -p "folder path length: " len
    i=len
    while [i > 0]; do
        read -p "Folder Name: " folder
        if [ ${#folder} <= 1 ]; then
            echo "Please, provide a valid folder name"
        fi
    done
}

createsln () {
    configs=$@

}

# donet core - end
# ====================================


# functions - end
# XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX




args=$@

