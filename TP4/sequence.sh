#!/bin/bash

if [[ $# != 2 && $# != 4 ]] 
then echo "Usage: ./sequence.sh [-c t] debut fin"; exit 1
fi

option_c=false
while getopts "c:" option; do
    if [[ $option == "c" ]]
        then option_c=true
        value_c=$OPTARG
    fi
done



if $option_c;
    then
        debut=$3
        fin=$4
        index=1

        while [[ $((debut+index*value_c)) -le $fin ]]
            do
                echo $((debut+index*value_c))
                ((index++))
            done
   

    else
        debut=$1
        fin=$2
        for ((index=debut; index<=fin; index++)); do
            echo $index
        done
fi