#!/bin/bash
# run compliant fasta on each proteom file
for f in `ls /lustre/projects/staton/projects/orthoGroups_hardwoods/archive/*.fa`
do
# get the base ID
base=$(echo $f | cut -f 8 -d '/' | sed 's/\.fa//g')
# submit base ID to adjust fasta
/lustre/projects/staton/software/orthomclSoftware-v2.0.9/bin/orthomclAdjustFasta $base $f 2
done
