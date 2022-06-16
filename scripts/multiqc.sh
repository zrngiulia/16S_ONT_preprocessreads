#!/bin/bash

input_folder=$1

cd ${input_folder}
multiqc .
