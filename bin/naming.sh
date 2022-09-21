#! bash

alias naming="naming.sh"

segment () {
    IFS=$2
    readarray -d / -t segments <<<"$1"
    echo ${segments[@]}
}

capitalize () {
    all=`segment $1 -`
    all_new=""
    for each in ${all[@]}; do
        all_new="$all_new$(tr '[:lower:]' '[:upper:]' <<< ${each:0:1})${each:1}"
    done
    # all="$(tr '[:lower:]' '[:upper:]' <<< ${all:0:1})${all:1}"
    echo $all_new
    # capitals=tr "/^[:space][a-z]" "/^[A-Z]" <<< $1
}

coll1=`segment $1 /`
coll2=""
for element in ${coll1[@]}; do
    coll2="$coll2.`capitalize $element`"
done

echo ${coll2:1}
