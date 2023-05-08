#!/bin/bash
array=( hadoopNode02 hadoopNode03 hadoopNode04 hadoopNode05 hadoopNode06 )
for i in "${array[@]}"
do
        echo "hadoopUser@$i"
        ssh "hadoopUser@${i}" rm -r /app/hadoop/tmp/*
        ssh "hadoopUser@${i}" rm -r /app/hadoop/data/datanode/*
done
