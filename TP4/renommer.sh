#!/bin/bash


if [ $# -ne 1 ];
 then
    echo "Usage: $0 <répertoire>"
    exit 1
fi

directory="$1"


if [ ! -d "$directory" ]; 
then
    echo "Le répertoire spécifié n'existe pas ou n'est pas un répertoire."
    exit 1
fi

for file in "$directory"/*; 
do
    if [ -f "$file" ];
     then filename=$(basename "$file")


     echo -n "Je traite $file --> "
        
        #récupérer l'extension d'un fichier
        extension="${filename##*.}"
        
        if [ "$extension" != "jpg" ]; 
        then
            if [ "$filename" = "$extension" ]; 
            then
                echo "mv \"$file\" \"$file.jpg\""
            else
                newname="${file%.*}.jpg"
                echo "mv \"$file\" \"$newname\""
            fi
        else echo " est OK, rien à lancer"
        fi
    fi
done