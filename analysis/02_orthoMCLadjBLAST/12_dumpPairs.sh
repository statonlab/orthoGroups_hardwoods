#!/bin/bash
/lustre/projects/staton/software/orthomclSoftware-v2.0.9/bin/orthomclDumpPairsFiles 03_orthomcl.cfg
echo "When this is finished running stop the server:
export MYSQL_HOME=/lustre/projects/staton/software/mysql-5.6.23
cd /lustre/projects/staton/software/mysql-5.6.23
/lustre/projects/staton/software/mysql-5.6.23/support-files/mysql.server stop"
