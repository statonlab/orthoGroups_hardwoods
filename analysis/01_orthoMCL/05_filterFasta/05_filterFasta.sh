#!/bin/bash
# now to filter good/bad proteins
/lustre/projects/staton/software/orthomclSoftware-v2.0.9/bin/orthomclFilterFasta ../04_compliantFasta 10 20
# split for doing blast searches
split.pl goodProteins 1000
