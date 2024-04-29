# README


Scripts to pre-process full-length (V1-V9) 16S rRNA gene reads generated using the SQK-16S024 kit.
This is a simple pipeline that starts from FAST5 raw files from any Oxford Nanopore Technologies (ONT) platform, and outputs filtered, trimmed, demultiplexed FASTQ files.

The output files are ready to use for downstream taxonomic classification with the software of choice.
It includes the following steps:

1. High Accuracy (HAC) GPU-based Basecalling of FAST5 files and quality filtering qscore >=9 - Guppy
1. Quality Control 1 - fastQC
1. Demultiplexing, trimming and chimera removal of FASTQ files - Guppy
1. Length filtering (min 1000 bp; max 2000 bp) - awk
1. Quality Control 2 - fastQC
1. MultiQC


To run the standard pre-processing pipeline:
```
# For the regular locally run pipeline (Guppy v6.0.1)
mkdir /path/to/main_working_directory/
bash /path/to/preprocess.sh /path/to/main_working_directory /path/to/nanopore_raw_data /path/to/this_repo FLO-FLG001

# For the sbatch pipeline (Guppy v6.5.7)
sbatch /path/to/preprocess_sbatch1.sh /path/to/main_working_directory /path/to/nanopore_raw_data /path/to/this_repo FLO-FLG001
```

Regarding flow cell codes, choose between:

* FLO-FLG001 (for Flongle sequencing flow cell)
* FLO-MIN106 (for standard MinION flow cell)


Necessary software:

* Guppy (ONT) (https://cdn.oxfordnanoportal.com/software/analysis/ont-guppy_6.5.7_linux64.tar.gz)
* fastQC (https://www.bioinformatics.babraham.ac.uk/projects/fastqc/)
* multiQC (https://github.com/MultiQC/MultiQC)
