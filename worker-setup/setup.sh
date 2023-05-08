apt-get update
apt-get -y install openjdk-8-jdk
groupadd hadoopGroup
useradd -g hadoopGroup -m hadoopUser
(echo 'hadoop'; echo 'hadoop') | passwd hadoopUser
sudo chsh -s /bin/bash hadoopUser
mkdir -p /app/hadoop/tmp
mkdir -p /app/hadoop/data/datanode
chown -R hadoopUser:hadoopGroup /app/hadoop/tmp
chown -R hadoopUser:hadoopGroup /app/hadoop/data
chmod -R 755 /app/hadoop
(echo '/home/hadoopUser/.ssh/id_rsa') | su - hadoopUser -c "ssh-keygen -t rsa -P ''"
cat /home/hadoopUser/.ssh/id_rsa.pub >> /home/hadoopUser/.ssh/authorized_keys
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDJcPOqfhtDWksP+0aNazFyIU3znRakaTK0ALJA3ZJxvgwyaT2+7QVBvxA/qaYjpwKOGeyRAJVFjYRLDUDp/L54/3UPR/pwT6R2XnQOYl9wDjj/Xza5DgfLIWsRPxftmhwrd56LMo8q7DKEIlHD8IIss1U7Np+clrCeRvwvhWV2kgGoO56j0nn9ssBhsWs5Eh0RziDpQCE70+zVmN5Veu7ZPlaU+g3GjyVan+TmRunX0JUxaHaY5Y2yVE1yLcI6gs1MVmMSI9a5LB8keczw5SUMeuQrIgx0Y+qT+pEmrBUWteaf46s8EfEmXbfhgLyEznP1Er9uEreDZfxmz/lVEFpXjQwFTaDKt/JExDYswQv9i8gzO2jRvs9v1G3O+RhtNLAoVLW+s0qn33pVdqJB8seXSUT6HeH/XgP3Bdk/+MwGeXwGjJGfm78rP+5Nybuwc6RRQVQ8bIvDj+LGV0FdgwMtNbIg/V9l3zyuXGeYV4IGKxQI4EnTFmSwxr/HnknNW50= hadoopUser@hadoopNode01" >> /home/hadoopUser/.ssh/authorized_keys
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDBgD41281jPLRfUfVwTBaV3aekxtyJD0F+oLu9nVRLnrmD1e4jXXmvf6QQO/H+hVD4VHjES6ZhLNjK5qYrWx2h4BMh6PBAFNzGVHcxzijlaazuqyVdKRsBit3pe8fkckNMsSRNgapRHLZ8Hjp2Rq3bTswymgFQOQgt9y9hyOME4RW95hf6LsvYZQ3u+SMJlzAa3JUwui3tY398Z53dSC+x5ZyNGIOIsQMshMu4ijPF1hiJrHuHfauxLus5Md3QyY5spj3xcqFskGLX7C2ps6AY8jhTmLyui5kT6f+va47Wb7aqtLpH1OVqUqJN7nCwn/rrYBZ8DAFKXcQgk+ni1bMux380kHEpME8UcRG3w5m0K8jybWcjznP1dIpV4BDGmRrRN44asIiiN4uRMZpHWSlYcnRgI6O3LWEKsxy40ohfUqEExDpZYF/SUkDmpHGaaq0fHtvwhavBq5mHr61rn1or7MmFwX6xeH25LlReQasXQl4s8+u0ELD+SKZGdoREjqk= ubuntu@hadoopNode01" >> /home/hadoopUser/.ssh/authorized_keys
echo "export HADOOP_HOME=/usr/local/hadoop
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
export PATH=$JAVA_HOME/bin:$PATH
export PATH=$PATH:$HADOOP_HOME/bin
export HADOOP_CONF_DIR=$HADOOP_HOME/conf" >> /home/hadoopUser/.bashrc
su - hadoopUser -c "source /home/hadoopUser/.bashrc"
