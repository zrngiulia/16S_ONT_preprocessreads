# README


Scripts to pre-process full-length (V1-V9) 16S rRNA gene reads from Oxford Nanopore Technologies (ONT) platform.
It includes the following steps:

1. Basecalling of FAST5 files (and quality filtering qscore >=9) - Guppy
1. Quality control 1 - fastQC
1. Demultiplexing, trimming and chimera removal of FASTQ files - Guppy
1. Length filtering (min 1000 bp; max 2000 bp) - awk
1. Quality control 2 - fastQC
1. MultiQC


To run the standard pre-processing pipeline:

```
mkdir /path/to/main_working_directory/
bash /path/to/preprocess.sh /path/to/main_working_directory /path/to/nanopore_raw_data /path/to/this_repo FLO-FLG001

# for the sbatch pipeline
bash /path/to/preprocess_sbatch1.sh /path/to/main_working_directory /path/to/nanopore_raw_data /path/to/this_repo FLO-FLG001
bash /path/to/preprocess_sbatch2.sh /path/to/main_working_directory /path/to/nanopore_raw_data /path/to/this_repo FLO-FLG001
```

Choose between:

FLO-FLG001 (for Flongle sequencing flow cell)
FLO-MIN106 (for standard MinION flow cell)


