#!/bin/bash
# output dirs
mkdir ogs
mkdir 07_hits
# loop to submit blast jobs for each of the 1000 partitions, will concatenate after
for f in `ls 05_filterFasta/*.fasta.*`
do
base=$(echo $f | cut -d '.' -f 3)
echo "#$ -N gp.$base
#$ -cwd
#$ -e ogs/ogs.err.$base
#$ -o ogs/ogs.out.$base
module load blast
blastp \
-query $f \
-db goodProteins.fasta \
-out 07_hits/gp.$base.tsv \
-evalue 1e-5 \
-outfmt 6 \
-seg yes \
-soft_masking true \
-max_target_seqs 9999" > job.ogs
qsub job.ogs
rm -f job.ogs
done
