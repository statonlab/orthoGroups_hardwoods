#!/bin/bash
# create a blast database of goodProteins.fasta
module load blast
makeblastdb -in 05_filterFasta/goodProteins.fasta \
-dbtype prot \
-title goodProteins.fasta \
-out goodProteins.fasta \
-logfile 06_log.txt
