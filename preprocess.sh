#!/bin/bash

# standard preprocessing pipeline

# folder where preprocessing data will be saved
wkdir=$1
# folder where nanopore raw data (FAST5) are stored
input_folder=$2
# 16S_ONT_preprocessreads repo folder
repo=$3
# change here for a different flow cell (FLO-FLG001 or ...)
flowcell=$4

bcalled=${wkdir}/basecalled/
demux=${wkdir}/barcoded_trimmed/
filt=${wkdir}/length_filtered/
qcrep=${wkdir}/qc_reports/

# go into main wkdir
cd ${wkdir}

# create necessary folders
mkdir -p ${bcalled}
mkdir -p ${qcrep}
mkdir -p ${demux}
mkdir -p ${filt}

# basecalling
echo -e "\n... ... ... ... Starting basecalling ... ... ... ... \n"
bash ${repo}/scripts/basecall.sh ${input_folder} ${bcalled} ${flowcell}
echo -e "\nStep done!\n"

# Quality control on unprocessed reads
echo -e "\n... ... ... ... Starting QC1 ... ... ... ... \n"
bash ${repo}/scripts/qc.sh ${bcalled}/pass/ basecalled ${qcrep}
echo -e "\nStep done!\n"

# Demultiplexing
echo -e "\n... ... ... ... Starting demultiplexing and barcode trimming ... ... ... ... \n"
bash ${repo}/scripts/demultiplex.sh ${bcalled}/pass/ ${demux}
echo -e "\nStep done!\n"

# Length filtering
echo -e "\n... ... ... ... Starting filtering by length ... ... ... ... \n"
bash ${repo}/scripts/lengthfilt.sh ${demux} ${filt}
echo -e "\nStep done!\n"

# Quality control on processed reads
echo -e "\n... ... ... ... Starting QC2 ... ... ... ... \n"
bash ${repo}/scripts/qc.sh ${filt} preprocessed ${qcrep}
echo -e "\nStep done!\n"

# MultiQC
echo -e "\n... ... ... ... Starting multiQC ... ... ... ... \n"
bash ${repo}/scripts/multiqc.sh ${qcrep}
echo -e "\nStep done!\n"


