#!/bin/bash

# Input files: *_1.fastq, *_2.fastq
# Output files: *_1_val_1.fq, *_2_val_2.fq

CORE=$EXPcore    # number of CPU cores

cd ..  # ~/
mkdir Raw
mkdir Trimmed
mkdir FastQC

# trimmed files are in ~/Trimmed/, FastQC results are in ~/FastQC
trim_galore -o Trimmed --paired ${EXP1}_1.fastq ${EXP1}_2.fastq --fastqc --fastqc_args "--nogroup -t $CORE -o FastQC"

mv ${EXP1}_1.fastq ./Raw  # ~/Raw
mv ${EXP1}_2.fastq ./Raw  # ~/Raw

cd ./StringTie  # ~/StringTie
