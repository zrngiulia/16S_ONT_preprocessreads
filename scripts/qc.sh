#!/bin/bash

input_folder=$1
stage=$2
output_folder=$3


cat ${input_folder}/pass/*.fastq >> ${input_folder}/${stage}.fastq
#run fastqc on all.fastq
fastqc ${input_folder}/${stage}.fastq -o ${output_folder}
