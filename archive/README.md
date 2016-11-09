create copies of all of the transcriptome amino acid sequences here.


The setup file creates copies using a shortened name for each of the sequences. This is done to make the analysis easier.
####create copies of files in archive
```
cp /lustre/projects/staton/projects/hardwoods/unigenes/1.1_tulip_poplar/version_10_13_2014/fixed_peptides/Liriodendron_tulipifera_10132014_peptide_fixed_4.fasta ./LT.fa
cp /lustre/projects/staton/projects/hardwoods/unigenes/1.4_green_ash/version_120313_miseq_trinity_cdhit/fixed_peptides/Fraxinus_pennsylvanica_120313_peptides.fixed_4.fasta ./FP.fa
cp /lustre/projects/staton/projects/hardwoods/unigenes/1.5_black_walnut/version_120313_miseq_trinity_cdhit/fixed_peptides/Juglans_nigra_120313_peptides.fixed_4.fasta ./JN.fa
cp /lustre/projects/staton/projects/hardwoods/unigenes/1.6_red_oak/version_120313_miseq_454_trinity_cdhit/fixed_peptides/Quercus_rubra_120313_peptides.fixed_4.fasta ./QR.fa
cp /lustre/projects/staton/projects/hardwoods/unigenes/1.7_black_gum/version_10_13_2014/fixed_peptides/Nyssa_sylvatica_10132014_peptide.fixed_4.fasta ./NS.fa
cp /lustre/projects/staton/projects/hardwoods/unigenes/1.8_honey_locust/version_082614/fixed_peptides/Gleditisia_triacanthos_082614_peptides.fixed_4.fasta ./GT.fa
cp /lustre/projects/staton/projects/hardwoods/unigenes/1.9_sugar_maple/version_022416/1_assembly/4_transdecoder/Acer_saccharum_022416_peptides.fasta ./AS.fa
cp /lustre/projects/staton/projects/hardwoods/unigenes/1.10_american_sweetgum/version_01052015/fixed_peptides/Liquidambar_styraciflua_01052015_peptides.fixed_4.fasta ./LS.fa
cp /lustre/projects/staton/projects/hardwoods/unigenes/1.11_red_alder/version_021816_trinity/1_assembly/4_transdecoder/Alnus_rubra_021816_peptides.fasta ./ARu.fa
cp /lustre/projects/staton/projects/hardwoods/unigenes/1.12_white_alder/version_021816_trinity/1_assembly/4_transdecoder/Alnus_rhombifolia_021816_peptides.fasta ./ARh.fa
cp /lustre/projects/staton/projects/hardwoods/unigenes/1.13_american_beech/version_081508/1_assembly/1_transdecoder/Fagus_grandifolia_081508_peptides.fasta ./FG.fa
cp /lustre/projects/staton/projects/hardwoods/unigenes/1.14_american_chestnut/version_AC454_v3/1_assembly/1_transdecoder/Castanea_dentata_AC454_peptides.fasta ./CD.fa
cp /lustre/projects/staton/projects/hardwoods/unigenes/1.15_white_oak/version_WO454/1_assembly/1_transdecoder/WO454_contigs_v2.contigs.fasta.transdecoder.pep ./WO.fa
```
####contains some | in header lines, replace with _ using sed
```
sed -i 's/|/_/g' WO.fa
```
####contains some * in sequences, remove with sed
```
sed -i 's/\*//g' WO.fa
sed -i 's/\*//g' JN.fa
```
---
