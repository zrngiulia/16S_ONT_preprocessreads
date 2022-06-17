#!/bin/bash

input_folder=$1
output_folder=$2

# run a barcoding job on basecalled fastq files
command="guppy_barcoder -r --input_path ${input_folder} --save_path ${output_folder} --config configuration.cfg --barcode_kits SQK-16S024 --trim_barcodes --trim_primers --trim_adapters --detect_mid_strand_barcodes --device cuda:0"

echo $command

$command
