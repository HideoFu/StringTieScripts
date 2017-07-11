#!/bin/bash

# Argument is x of x_1.fastq

export EXPcore=6  # number of threads
export EXPgene=/mnt/nas/public/Homo_sapiens/NCBI/build37.2/Annotation/genes.gtf  # reference genome

for INDEX in $*
do
    export EXP1=$INDEX
    
    # switch paired read
    if [ -e ../${INDEX}_2.fastq ] ; then
        sh ./galore-paired.sh
	sh ./hisat2-paired.sh
    else
        sh ./galore.sh
	sh ./hisat2.sh
    fi
    
    sh ./samtools.sh  # outputs sorted.bam file.

    sh ./stringtie.sh
    list="$list${INDEX}.gtf " 

done

export EXPlist=$list
sh ./stringmerge.sh

for INDEX in $*
do
	export EXP1=$INDEX

    sh ./stringout.sh

done
