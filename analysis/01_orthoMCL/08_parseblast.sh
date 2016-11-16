#!/bin/bash
# parse blast resutls
/lustre/projects/staton/software/orthomclSoftware-v2.0.9/bin/orthomclBlastParser 07_blast.results.tsv 08_fasta >> 08_blast.parsed.tsv
