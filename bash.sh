#!/bin/bash
fileName=$((1 + RANDOM % 100000)).txt
echo $fileName
for var in "$@"
do   
    sha1sum $var | cut -d" " -f 1 >> ./${fileName}    
done
sha1sum $fileName | cut -d" " -f 1 
rm $fileName

