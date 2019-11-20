#!/bin/bash
fileName=$((1 + RANDOM % 100000))

while [ -e ${fileName}.txt ] 
do  
fileName=$((1 + RANDOM % 100000))
done
for var in "$@"
do 
    if [ -f $var ]
    then
        sha1sum $var | cut -d" " -f 1 >> ./${fileName}.txt    
    fi
done
sha1sum ${fileName}.txt | cut -d" " -f 1 
rm ${fileName}.txt

