#!/bin/bash
# running into an error when trying to load 08_blast.parsed.tsv. Going to try and shorten table. 
# I ran the following command to generate this script:
# head -n1 04_compliantFasta/*.fasta | grep "^>" | sed 's/^>//g' | sed 's/|/\t/g' | cut -d '_' -f 1-3 | sed 's/Fagus_grandifolia_081508/Fagus_grandifolia_081508_ABall/g' | awk '{print $2,$1}' | sed 's/ /\//g' | sed "s/^/sed -i 's\//g" | sed "s/$/\/g' 08_blast.tmp.parsed.tsv/g"
cp 08_blast.parsed.tsv 08_blast.tmp.parsed.tsv
# however, I also had to manually create extra lines for CAME
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
# here are extra lines for CAME, due to its strangeness
sed -i 's/augustus/a/g' 08_blast.tmp.parsed.tsv
sed -i 's/maker/m/g' 08_blast.tmp.parsed.tsv
sed -i 's/gene/g/g' 08_blast.tmp.parsed.tsv
sed -i 's/snap/s/g' 08_blast.tmp.parsed.tsv
