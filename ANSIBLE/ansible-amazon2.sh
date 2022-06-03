#/bin/bash               ### CENTOS AMAZON 5.2
sudo yum update -y
wget https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
sudo yum install epel-release-latest-7.noarch.rpm
sudo yum update -y
sudo yum install python python-devel python-pip openssl ansible -y
sudo amazon-linux-extras install ansible2