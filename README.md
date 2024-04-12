# README


Scripts to pre-process full-length (V1-V9) 16S rRNA gene reads generated using the SQK-16S024 kit.
The pipeline starts from FAST5 raw files from any Oxford Nanopore Technologies (ONT) platform.
It includes the following steps:

1. Basecalling of FAST5 files (and quality filtering qscore >=9) - Guppy
1. Quality control 1 - fastQC
1. Demultiplexing, trimming and chimera removal of FASTQ files - Guppy
1. Length filtering (min 1000 bp; max 2000 bp) - awk
1. Quality control 2 - fastQC
1. MultiQC


To run the standard pre-processing pipeline:
```
# For the regular pipeline (Guppy v6.0.1)
mkdir /path/to/main_working_directory/
bash /path/to/preprocess.sh /path/to/main_working_directory /path/to/nanopore_raw_data /path/to/this_repo FLO-FLG001

# For the sbatch pipeline (Guppy v6.5.7)
sbatch /path/to/preprocess_sbatch1.sh /path/to/main_working_directory /path/to/nanopore_raw_data /path/to/this_repo FLO-FLG001
```

Regarding flow cell codes, choose between:

* FLO-FLG001 (for Flongle sequencing flow cell)
* FLO-MIN106 (for standard MinION flow cell)


