#!/bin/bash
hashes=()

function hash_lines(){
    temp_hashes=()
    
    count=0
    for i in ${hashes[@]}
    do
        if [ $((count%2)) -ne 0 ]
        then 
        echo "------"
        echo $single$i
        echo "------"
        temp_hashes+=($(echo $i$single | sha1sum  | cut -d" " -f 1))
        echo "$i$single" | sha1sum  | cut -d" " -f 1
        # unset single
        else
        single=$i
        echo $single
        fi
        ((count=count+1)) 
    done
    if [ $((count%2)) -ne 0 ]
    then
    echo "xd" ${hashes[${count} - 1]} "xd"
    temp_hashes+=($(echo ${hashes[${count} - 1]} | sha1sum | cut -d" " -f 1))
    fi
    hashes=("${temp_hashes[@]}")
    unset temp_hashes
}



for var in "$@"
do
    if [ -f $var ]
    then
        hashes+=($(sha1sum $var | cut -d" " -f 1))
    fi
done
echo ${hashes[@]}
echo "-----------START-------------"
while [ "${#hashes[@]}" -ne 1 ]
do
echo "------------AGAIN------------"
echo "${#hashes[@]}"
hash_lines
done
echo "${#hashes[@]}"
echo ${hashes[@]}



