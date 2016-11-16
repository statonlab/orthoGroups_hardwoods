#!/bin/bash
# reversing what was done in 09_shortenTable.sh, create a copy of 14_groups to make changes to..
cp 14_groups.txt 15_groups.txt
# start by reversing CAME changes since they are so weird
sed -i 's/-a-/-augustus-/g' 15_groups.txt
sed -i 's/|a_/|augustus_/g' 15_groups.txt
sed -i 's/|m-/|maker-/g' 15_groups.txt
sed -i 's/-g-/-gene-/g' 15_groups.txt
sed -i 's/-s-/-snap-/g' 15_groups.txt
sed -i 's/|s_/|snap_/g' 15_groups.txt
# this part is easier just a flip from 09_shortenTable.sh
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
