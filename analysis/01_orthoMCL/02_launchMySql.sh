#!/bin/bash
# just an echo command to remind what needs to be run
echo "The following needs to be done:
export MYSQL_HOME=/lustre/projects/staton/software/mysql-5.6.23
cd /lustre/projects/staton/software/mysql-5.6.23
./bin/mysqld_safe --defaults-file=orthomcl.cnf --local_infile=1 &
/lustre/projects/staton/software/mysql-5.6.23/support-files/mysql.server start"
