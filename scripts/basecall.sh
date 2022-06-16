#!/bin/bash

input_folder=$1
output_folder=$2
flowcell=$3

command="guppy_basecaller -r --input_path ${input_folder} --save_path ${output_folder} --flowcell ${flowcell} --kit SQK-16S024 --device cuda:0"

echo $command

$command
