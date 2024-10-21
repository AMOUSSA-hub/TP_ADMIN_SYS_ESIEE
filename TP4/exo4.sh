#!/bin/bash

only_directory=true
echo $#

if [ $# -eq 0 ];
 then
    echo "Usage: $0 <répertoire> <répertoire> ... "
    exit 1
fi


for arg in "$@";
do
    
    if [ ! -d $arg ]
    then 
        echo "$arg n’est pas un répertoire, ignoré."
        only_directory=false

    else 
        if [ ! -z "$(ls -A "$arg")" ]
        then echo "Le répertoire $arg n'est pas vide, ignoré."

        else 
            read -p "Le répertoire $arg est vide, voulez-vous le supprimer (o/n) ?" response
             case $response in
             'o'|'O') rmdir $arg;;
            *);;
            esac
        fi

    fi
    
done

if [ $only_directory = true ]
    then exit 0
    else exit 1
fi
