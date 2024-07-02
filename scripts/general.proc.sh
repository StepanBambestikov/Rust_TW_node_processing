#!bin/bash

FILES=()
json_file=$1
program_path=$2
processing_type=$3
search_dir=$4
for current_stem_size in {5..20}
do
    FILES=()
    echo $current_stem_size
    echo "$search_dir"
    for dir in "$search_dir"/*
    do
        if [ -d "$dir" ]
        then
            for file in "$dir"/*
            do  
                if [[ $file == *_${current_stem_size}_0_nodes_new.txt ]]
                then
                    FILES+=($file)
                    echo $file
                fi
            done
        fi
    done
    $program_path $json_file $current_stem_size $processing_type "${FILES[@]}" > echo
done
