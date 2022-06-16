#!/bin/bash

input_folder=$1
output_folder=$2

#this is more correct
cd ${input_folder}
for i in $( ls | grep -P 'barcode\d+' ); do cat ${i}/*.fastq >  ${output_folder}/${i}pre.fastq; done

cd ${output_folder}
for i in $( ls | grep -Po 'barcode\d+' ); do echo $i && awk 'BEGIN {OFS = "\n"} {header = $0 ; getline seq ; getline qheader ; getline qseq ; if (length(seq) >= 1000 && length(seq) <= 2000) {print header, seq, qheader, qseq}}' < ${i}pre.fastq > ${i}.fastq && rm ${i}pre.fastq; done
