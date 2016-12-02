This will be an attempt at adjusting BLAST paramters to try and make more reasonable orthoMCL groups. Currently some of the larger groups are far too large... on the order of 10k+ transcripts in the largest groups.
####copy config file from run01
```
cp ../01_orthoMCL/03_orthomcl.cfg ./03_orthomcl.cfg
```
---
```
#export MYSQL_HOME=/lustre/projects/staton/software/mysql-5.6.23
#/lustre/projects/staton/software/mysql-5.6.23/bin/mysqld_safe --defaults-file=/lustre/projects/staton/software/mysql-5.6.23/my.cnf &
#/lustre/projects/staton/software/mysql-5.6.23/support-files/mysql.server start
echo "The following needs to be done:
export MYSQL_HOME=/lustre/projects/staton/software/mysql-5.6.23
cd /lustre/projects/staton/software/mysql-5.6.23
./bin/mysqld_safe --defaults-file=orthomcl.cnf --local_infile=1 &
/lustre/projects/staton/software/mysql-5.6.23/support-files/mysql.server start"
```
---
####run install schema on 03_orthomc.cfg, had to set host to 127.0.0.1 so it would use the internet socket instead of a IPC socket
```
/lustre/projects/staton/software/orthomclSoftware-v2.0.9/bin/orthomclInstallSchema 03_orthomcl.cfg
echo "This should fail with an error since the tables are already installed, but it's good to check."
```
---
####blast DB should be unchanged so once again we can just copy the previous run (should be 3 files):
```
cp ../01_orthoMCL/goodProteins.fasta.* ./
```
---
####output dirs, this BLAST run will be how we ultimately alter the final output
```
mkdir ogs
mkdir 07_hits
```
####loop to submit blast jobs for each of the 1000 partitions, will concatenate after
```
for f in `ls 05_filterFasta/*.fasta.*`
do
base=$(echo $f | cut -d '.' -f 3)
echo "#$ -N gp.$base
#$ -cwd
#$ -e ogs/ogs.err.$base
#$ -o ogs/ogs.out.$base
module switch intel-compilers/2016u3
module load blast
blastp \
-query $f \
-db goodProteins.fasta \
-out 07_hits/gp.$base.tsv \
-evalue 1e-5 \
-outfmt 6 \
-num_alignments 100000 \
-num_descriptions 100000 \
-dbsize 456780 \
-seg yes \
-soft_masking true" > job.ogs
qsub job.ogs
rm -f job.ogs
done
```
---
####output dirs, this BLAST run will be how we ultimately alter the final output
```
#mkdir ogs
#mkdir 07_hits
```
####loop to submit blast jobs for each of the 1000 partitions, will concatenate after
```
#for f in `ls 05_filterFasta/*.fasta.*`
#do
#base=$(echo $f | cut -d '.' -f 3)
#echo "#$ -N gp.$base
#$ -cwd
#$ -e ogs/ogs.err.$base
#$ -o ogs/ogs.out.$base
module load blast
legacy_blast.pl \
-F 'm S' \
-v 100000 \
-b 100000 \
-e 1e-5 \
-z 
blastp \
-query $f \
-db goodProteins.fasta \
-out 07_hits/gp.$base.tsv \
-evalue 1e-5 \
-outfmt 6 \
-seg yes \
-soft_masking true \
#-max_target_seqs 9999" > job.ogs
#qsub job.ogs
#rm -f job.ogs
#done
```
---
####parse blast resutls
```
/lustre/projects/staton/software/orthomclSoftware-v2.0.9/bin/orthomclBlastParser 07_blast.results.tsv 08_fasta >> 08_blast.parsed.tsv
```
---
####running into an error when trying to load 08_blast.parsed.tsv. Going to try and shorten table. 
```
??
```
####I ran the following command to generate this script:
```
head -n1 04_compliantFasta/*.fasta | grep "^>" | sed 's/^>//g' | sed 's/|/\t/g' | cut -d '_' -f 1-3 | sed 's/Fagus_grandifolia_081508/Fagus_grandifolia_081508_ABall/g' | awk '{print $2,$1}' | sed 's/ /\//g' | sed "s/^/sed -i 's\//g" | sed "s/$/\/g' 08_blast.tmp.parsed.tsv/g"
cp 08_blast.parsed.tsv 08_blast.tmp.parsed.tsv
```
####however, I also had to manually create extra lines for CAME
```
sed -i 's/Acer_saccharum_022416/ACSA/g' 08_blast.tmp.parsed.tsv
sed -i 's/Alnus_rhombifolia_021816/ALRH/g' 08_blast.tmp.parsed.tsv
sed -i 's/Alnus_rubra_021816/ALRU/g' 08_blast.tmp.parsed.tsv
sed -i 's/Castanea_dentata_AC454/CADE/g' 08_blast.tmp.parsed.tsv
sed -i 's/Fagus_grandifolia_081508_ABall/FAGR/g' 08_blast.tmp.parsed.tsv
sed -i 's/Fraxinus_pennsylvanica_120313/FRPE/g' 08_blast.tmp.parsed.tsv
sed -i 's/Gleditisia_triacanthos_082614/GLTR/g' 08_blast.tmp.parsed.tsv
sed -i 's/Juglans_nigra_120313/JUNI/g' 08_blast.tmp.parsed.tsv
sed -i 's/Liquidambar_styraciflua_01052015/LIST/g' 08_blast.tmp.parsed.tsv
sed -i 's/Liriodendron_tulipifera_10132014/LITU/g' 08_blast.tmp.parsed.tsv
sed -i 's/Nyssa_sylvatica_10132014/NYSY/g' 08_blast.tmp.parsed.tsv
sed -i 's/WO454_contig10004_v2/QUAL/g' 08_blast.tmp.parsed.tsv
sed -i 's/Quercus_rubra_120313/QURU/g' 08_blast.tmp.parsed.tsv
```
####here are extra lines for CAME, due to its strangeness
```
sed -i 's/augustus/a/g' 08_blast.tmp.parsed.tsv
sed -i 's/maker/m/g' 08_blast.tmp.parsed.tsv
sed -i 's/gene/g/g' 08_blast.tmp.parsed.tsv
sed -i 's/snap/s/g' 08_blast.tmp.parsed.tsv
```
---
####load results into orhomcl mysql database
```
/lustre/projects/staton/software/orthomclSoftware-v2.0.9/bin/orthomclLoadBlast 03_orthomcl.cfg 09_blast.parsed.tsv
/lustre/projects/staton/software/orthomclSoftware-v2.0.9/bin/orthomclPairs 03_orthomcl.cfg 11_log.txt cleanup=yes
/lustre/projects/staton/software/orthomclSoftware-v2.0.9/bin/orthomclDumpPairsFiles 03_orthomcl.cfg
echo "When this is finished running stop the server:
export MYSQL_HOME=/lustre/projects/staton/software/mysql-5.6.23
cd /lustre/projects/staton/software/mysql-5.6.23
/lustre/projects/staton/software/mysql-5.6.23/support-files/mysql.server stop"
/lustre/projects/staton/software/mcl_14.137/bin/mcl ./mclInput --abc -I 1.5 -o ./mclOutput
/lustre/projects/staton/software/orthomclSoftware-v2.0.9/bin/orthomclMclToGroups OG 1000 < mclOutput > 14_groups.txt
```
---
####reversing what was done in 09_shortenTable.sh, create a copy of 14_groups to make changes to..
```
cp 14_groups.txt 15_groups.txt
```
####start by reversing CAME changes since they are so weird
```
sed -i 's/-a-/-augustus-/g' 15_groups.txt
sed -i 's/|a_/|augustus_/g' 15_groups.txt
sed -i 's/|m-/|maker-/g' 15_groups.txt
sed -i 's/-g-/-gene-/g' 15_groups.txt
sed -i 's/-s-/-snap-/g' 15_groups.txt
sed -i 's/|s_/|snap_/g' 15_groups.txt
```
####this part is easier just a flip from 09_shortenTable.sh
```
sed -i 's/|ACSA/|Acer_saccharum_022416/g' 15_groups.txt
sed -i 's/|ALRH/|Alnus_rhombifolia_021816/g' 15_groups.txt
sed -i 's/|ALRU/|Alnus_rubra_021816/g' 15_groups.txt
sed -i 's/|CADE/|Castanea_dentata_AC454/g' 15_groups.txt
sed -i 's/|FAGR/|Fagus_grandifolia_081508_ABall/g' 15_groups.txt
sed -i 's/|FRPE/|Fraxinus_pennsylvanica_120313/g' 15_groups.txt
sed -i 's/|GLTR/|Gleditisia_triacanthos_082614/g' 15_groups.txt
sed -i 's/|JUNI/|Juglans_nigra_120313/g' 15_groups.txt
sed -i 's/|LIST/|Liquidambar_styraciflua_01052015/g' 15_groups.txt
sed -i 's/|LITU/|Liriodendron_tulipifera_10132014/g' 15_groups.txt
sed -i 's/|NYSY/|Nyssa_sylvatica_10132014/g' 15_groups.txt
sed -i 's/|QUAL/|WO454_contig10004_v2/g' 15_groups.txt
sed -i 's/|QURU/|Quercus_rubra_120313/g' 15_groups.txt

echo "running:"
qstat | grep "r" | wc -l
echo "queue'd:"
qstat | grep "qw" | wc -l
```
---
