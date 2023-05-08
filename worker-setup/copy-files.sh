#!/bin/bash
array=( hadoopNode02 hadoopNode03 hadoopNode04 hadoopNode05 hadoopNode06 hadoopNode07 hadoopNode08 )
for i in "${array[@]}"
do
	echo "ubuntu@$i"
	scp /etc/hosts "ubuntu@${i}:/home/ubuntu/"
	ssh "ubuntu@${i}" sudo cp /home/ubuntu/hosts /etc/
	scp /usr/local/hadoop/conf/slaves "ubuntu@${i}:/home/ubuntu/"
	ssh "ubuntu@${i}" sudo cp /home/ubuntu/slaves /usr/local/hadoop/conf/
done
