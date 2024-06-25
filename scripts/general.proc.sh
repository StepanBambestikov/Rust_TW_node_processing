#!bin/bash

FILES=()
json_file=./for_analysis/assembly_data_report.jsonl
program_path=./rust_processing/target/debug/dna_analisys
processing_type=shuffled
for current_stem_size in {5..20}
do
    FILES=()
    echo $current_stem_size
    for dir in ./path_to_folder/*
    do
        if [ -d "$dir" ]
        then
            for file in "$dir"/*
            do  
                if [[ $file == *_${current_stem_size}_0_nodes_new.txt ]]
                then
                    FILES+=($file)
                fi
            done
        fi
    done
    $program_path $json_file $current_stem_size $processing_type "${FILES[@]}" > echo
done
