#!/bin/bash

input_folder=$1
stage=$2
output_folder=$3


cat ${input_folder}/*.fastq > ${input_folder}/${stage}.fastq
#run fastqc on all.fastq
command="fastqc -t 4 ${input_folder}/${stage}.fastq -o ${output_folder}"

echo $command

$command
