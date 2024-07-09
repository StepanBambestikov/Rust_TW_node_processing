
# Algorithm for grouping TW-type input pseudo-nodes among a variety of genomes

This repository is an implementation of an algorithm for grouping TW-type input pseudo-nodes among a variety of genomes, written in the Rust language.

## Description

This algorithm processes input files including the location of pseudonodes in genomes generated using the algorithm from the [TW_node_parallel_algorithm](https://github.com/StepanBambestikov/TW_node_parallel_algorithm.git) repository

The format of the input files is as follows:

```
    >NW_003852397.1 Otolemur garnettii isolate 467f Iridium unplaced genomic scaffold, OtoGar3 scaffold00002, whole genome shotgun sequence 2605729 2605737 2605740 2605748 2605759 2605767 2605769 2605777 5 13 4 x3 score 0 x4 score 0 
    TAATCCCCTTGAGATATCACCTAATCTCAAGGGGATTAGGTGATATCT
    >NW_003852397.1 Otolemur garnettii isolate 467f Iridium unplaced genomic scaffold, OtoGar3 scaffold00002, whole genome shotgun sequence 2605730 2605738 2605740 2605748 2605758 2605766 2605769 2605777 4 12 5 x3 score 0 x4 score 0 
    AATCCCCTTGAGATATCACCTAATCTCAAGGGGATTAGGTGATATCT
    >NW_003852397.1 Otolemur garnettii isolate 467f Iridium unplaced genomic scaffold, OtoGar3 scaffold00002, whole genome shotgun sequence 2605730 2605738 2605741 2605749 2605758 2605766 2605768 2605776 5 11 4 x3 score 0 x4 score 0 
    AATCCCCTTGAGATATCACCTAATCTCAAGGGGATTAGGTGATATC
    >NW_003852397.1 Otolemur garnettii isolate 467f Iridium unplaced genomic scaffold, OtoGar3 scaffold00002, whole genome shotgun sequence 2605731 2605739 2605741 2605749 2605757 2605765 2605768 2605776 4 10 5 x3 score 0 x4 score 0 
    ATCCCCTTGAGATATCACCTAATCTCAAGGGGATTAGGTGATATC
    >NW_003852397.1 Otolemur garnettii isolate 467f Iridium unplaced genomic scaffold, OtoGar3 scaffold00002, whole genome shotgun sequence 3609472 3609480 3609487 3609495 3609504 3609512 3609515 3609523 9 11 5 x3 score 0 x4 score 0 
    CATAAATTATACACTATTTAAATTGCACATGAAATTTATGTATATTTAAAT
    >NW_003852397.1 Otolemur garnettii isolate 467f Iridium unplaced genomic scaffold, OtoGar3 scaffold00002, whole genome shotgun sequence 4334979 4334987 4334990 4334998 4335010 4335018 4335020 4335028 5 14 4 x3 score 0 x4 score 0 
    TCTAAATAAATATATTAAATGATTAATAAACTATTTAGACATTTAATAT
    >NW_003852397.1 Otolemur garnettii isolate 467f Iridium unplaced genomic scaffold, OtoGar3 scaffold00002, whole genome shotgun sequence 4941731 4941739 4941741 4941749 4941759 4941767 4941773 4941781 4 12 8 x3 score 0 x4 score 0 
    AATTATTGAAGAGAAGAATGTATAGCTGCAATAATTTCTTTTTTCTTCTC
    >NW_003852397.1 Otolemur garnettii isolate 467f Iridium unplaced genomic scaffold, OtoGar3 scaffold00002, whole genome shotgun sequence 6248494 6248502 6248504 6248512 6248521 6248529 6248533 6248541 4 11 6 x3 score 0 x4 score 0 
    CCCATTTATGGAGTTATTCCATGCCCATAAATGGGCATGAATAACTC
    >NW_003852397.1 Otolemur garnettii isolate 467f Iridium unplaced genomic scaffold, OtoGar3 scaffold00002, whole genome shotgun sequence 6248494 6248502 6248505 6248513 6248521 6248529 6248532 6248540 5 10 5 x3 score 0 x4 score 0 
    CCCATTTATGGAGTTATTCCATGCCCATAAATGGGCATGAATAACT
    .  .  .
   ```

Besides, assembly_data_report is required.a json file with the names of the input organisms

## Workflow

First of all, the algorithm filters the input nodes by removing the structures that form the hairpin structures

For the remaining sequences, the following is generated:
   - A file with unique pseudonodes in the genome, along with the number of its repetitions, for all input files, respectively
   - A file with pseudonodes among all input genomes with pseudonodes with the same length of the duplex section.

File with unique pseudonodes is as follows:

```
    Unique number: 29363
    All sequence number: 32730
    1: TTCTTCATATTCTGCTAGACAGAAGAATTCTCAGAAT - 373
    2: CAAAGAAGCATTCAGAGAAACTTCTTTGTGATGAATG - 51
    3: ACTTGTGATTCATCAATCAAAATACAAGTGTGGGATGAA - 25
    4: GAGGAACTTCTAACCTGTGTTGTTTCCTCTCTTTCAGGTT - 23
    5: TATATGTGTGTGTGTACACACGCATATATACATACACA - 20
    6: AATCACAGCTGAGGCTTCTAAGCGGTGATTCTCAGCCTC - 19
    7: GCTGCCAAGCTCCTGGGCTTTGGGGCAGCCCCAGGAG - 17
    8: CTCAGTCAGAGGCTGATGCCGGAACTGAGACCATCAGC - 16
    9: TCTCAGTCAGAGGCTGATGCCGGAACTGAGACCATCAGC - 16
    10: TCTCAGTCAGAGGCTGATGCCGGAACTGAGACCATCAGCC - 16
    11: CTCAGTCAGAGGCTGATGCCGGAACTGAGACCATCAGCC - 16
    12: AACCTGAAAGAGAGGAAACAACACAGGTTAGAAGTTCCTC - 15
    13: GGCTGATGGTCTCAGTTCCGGCATCAGCCTCTGACTGAGA - 13
    14: GCTGATGGTCTCAGTTCCGGCATCAGCCTCTGACTGAG - 13
    15: GGCTGATGGTCTCAGTTCCGGCATCAGCCTCTGACTGAG - 13
    16: GCTGATGGTCTCAGTTCCGGCATCAGCCTCTGACTGAGA - 13
    17: TTCTTCATATTCTGCTAGAAAGAAGAATTCTCAGAAT - 12
    18: TAAATAAATTGTATTCTGTGTATTTAAGGTATACAA - 12
    19: TTTCTATTGAAAGAGCAGTTTAGAAACAGTCTTTC - 12
    20: CCAGGACTCAGTCCTCCAGCATCCTGGGATGTGGACTG - 12
    21: TTAAATAAATTGTATTCTGTGTATTTAAGGTATACAA - 12
    .  .  .
   ```

File with pseudonodes among all genomes is as follows:

```
Homo sapiens,Mus musculus,Cavia porcellus,Dipodomys ordii,Carlito syrichta,Microcebus murinus,Otolemur garnettii,Cricetulus griseus,Heterocephalus glaber,Octodon degus,Chinchilla lanigera,Microtus ochrogaster,Tupaia chinensis,Nannospalax galili,Galeopterus variegatus,Colobus angolensis palliatus,Mandrillus leucophaeus,Aotus nancymaae,Cercocebus atys,Macaca nemestrina,Propithecus coquereli,Marmota marmota marmota,Cebus imitator,Rhinopithecus bieti,Castor canadensis,Piliocolobus tephrosceles,Theropithecus gelada,Macaca mulatta,Urocitellus parryii,Cricetulus griseus,Marmota flaviventris,Peromyscus maniculatus bairdii,Peromyscus leucopus,Grammomys surdaster,Nomascus leucogenys,Rhinopithecus roxellana,Peromyscus californicus insignis,Mastomys coucha,Papio anubis,Sapajus apella,Trachypithecus francoisi,Oryctolagus cuniculus,Hylobates moloch,Homo sapiens,Rattus rattus,Callithrix jacchus,Arvicanthis niloticus,Fukomys damarensis,Macaca fascicularis,Microtus fortis,Rattus norvegicus,Chlorocebus sabaeus,Saimiri boliviensis boliviensis,Ictidomys tridecemlineatus,Ochotona curzoniae,Mesocricetus auratus,Microtus oregoni,Dipodomys spectabilis,Lemur catta,Jaculus jaculus,Marmota monax,Perognathus longimembris pacificus,Macaca thibetana thibetana,Nycticebus coucang,Pan troglodytes,Symphalangus syndactylus,Pongo pygmaeus,Pongo abelii,Gorilla gorilla gorilla,Pan paniscus,Meriones unguiculatus,Ochotona princeps,Mus caroli,Mus pahari,Sciurus carolinensis,Myodes glareolus,Arvicola amphibius,Onychomys torridus,Acomys russatus,Psammomys obesus,Phodopus roborovskii,Apodemus sylvaticus,Peromyscus eremicus,Chionomys nivalis,
TAGTGCGCTATGCCGATCGGGTGTCCGCACTAAGTTCGGCAT,3,2,0,0,0,29,1,2,0,0,0,2,1,0,3,3,2,10,1,2,3,1,8,3,0,0,0,1,1,0,1,4,2,1,1,5,2,1,2,13,0,0,0,0,0,5,1,0,2,4,6,0,6,1,1,10,2,0,2,0,2,0,0,0,0,0,0,0,0,2,3,0,1,0,1,8,0,2,2,2,4,2,3,3,
ATGCCGAACTTAGTGCGGACACCCGATCGGCATAGCGCACTA,2,1,0,0,0,37,2,1,0,0,0,3,1,0,4,2,3,8,2,1,1,2,10,1,0,0,1,2,2,0,1,2,1,2,2,4,2,1,0,7,0,0,0,0,1,4,3,0,2,3,7,0,1,1,3,4,3,0,1,0,1,0,0,0,0,0,0,0,0,3,2,0,2,0,1,7,2,1,3,2,4,2,1,2,
AATGCCTTACAGTTGGATCTCATGGAGGCATTTCCCCAACTG,0,71,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,54,1,0,0,0,0,0,0,0,1,0,0,
AAATGCCTTACAGTTGGATCTCATGGAGGCATTTCCCCAACTG,0,71,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,53,1,0,0,0,0,0,0,0,0,0,0,
CAGTTGGGGAAATGCCTCCATGAGATCCAACTGTAAGGCATT,0,68,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,52,2,0,0,0,0,0,0,0,2,0,0,
CAGTTGGGGAAATGCCTCCATGAGATCCAACTGTAAGGCATTT,0,67,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,52,1,0,0,0,0,0,0,0,2,0,0,
GTTCTCATTGTTCAACACCAGCCTATGAGTGAGAACATGTGGTGTT,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,5,0,0,0,0,8,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,10,0,0,0,0,0,13,0,0,0,0,0,0,13,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
    .  .  .
   ```
The file is a table with all aquatic organisms and pseudo-nodes. The table shows where, how many times and in which genome the pseudonode occurs. Only those pseudonodes that are located in at least two genomes are added


## Installation

### 1. Install cargo package

   ```bash
   sudo apt-get install cargo
   ```

### 2. Compile the program (in the root of the project)

   ```bash
   cargo build
   ```

### 3. Run the program

   ```bash
    program_path json_file current_stem_size processing_type output_file_folder file1 file2 file3 . . .
   ```
Where:
   - `program_path.fna`: path to the compiled program
   - `json_file`: json file with organisms names
   - `current_stem_size`: duplex area size
   - `processing_type`: a reminder for the names of the output files does not affect the progress of the program
   - `output_file_folder`: folder where output file with all genome pseudo_nodes will be
   - `file*`: input files with pseudo nodes

The analyzed file should be contained in a folder with the name of the organism code, according to which the name of the organism is searched in the json file. For example:
   ```bash
    GCF_950005125.1 <- containing folder
    ├── GCF_950005125.1_mChiNiv1.1_genomic.fna_10_0_nodes_new.txt <- analysing file
   ```

## Bash script for analyzing multiple files

The project also has a bash script for processing all genomic files inside the required folder. Processing takes place over all duplex sections from 5 to 20


### Run the script

   ```bash
   bash general_proc.sh json_file_path program_path processing_type search_dir
   ```

Where:
   - `json_file_path`: Rellative path to the json file with the organism names
   - `program_path`: Rellative path to the program
   - `processing_type`: Designation of the current processing
   - `search_dir`: Dir with analyzed files
