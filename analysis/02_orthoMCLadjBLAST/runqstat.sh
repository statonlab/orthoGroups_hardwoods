#!/bin/bash
echo "running:"
qstat | grep "r" | wc -l
echo "queue'd:"
qstat | grep "qw" | wc -l
