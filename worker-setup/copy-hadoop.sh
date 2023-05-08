echo "Copying hadoop to $1"
scp -r /usr/local/hadoop "ubuntu@${1}:/home/ubuntu"
ssh "ubuntu@${1}" sudo cp -r /home/ubuntu/hadoop /usr/local/
ssh "ubuntu@${1}" sudo chown -R hadoopUser:hadoopGroup /usr/local/hadoop
