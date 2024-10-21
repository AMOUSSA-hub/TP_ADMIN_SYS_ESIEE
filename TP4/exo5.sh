#!/bin/bash

if [ $# -eq 0 ];
 then
    echo "Usage: $0 <répertoire> <répertoire> ... "
    exit 1
fi

failed_finds=0
index=1

for arg in "$@";
do

    find $arg -type d 2> find_results/find-$index.log > find_results/find-$index.txt    

    if [ $? -ne 0 ]
        then ((failed_finds++))
    fi    
    ((index++))
done

exit $failed_finds
