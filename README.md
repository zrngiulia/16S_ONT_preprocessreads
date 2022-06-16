# README

Scripts to pre-process 16S reads from ONT platform.
It includes the following steps:

1. Basecalling of FAST5 files (and quality filtering)
1. QC1
1. Demultiplexing, trimming and chimera removal of FASTQ files
1. Length filtering
1. QC2
1. MultiQC


To run the standard pre-processing pipeline:

```
mkdir /path/to/main_working_directory/
bash /path/to/preprocess.sh /path/to/main_working_directory /path/to/nanopore_raw_data path/to/this_repo FLO-FLG001
```



ʕ♥ᴥ♥ʔ
