#!/bin/bash
sudo yum -y update
sudo yum -y install httpd
sudo systemctl enable httpd
sudo systemctl start httpd
sudo yum -y install ruby
sudo yum -y install wget
wget https://aws-codedeploy-us-east-1.s3.us-east-1.amazonaws.com/latest/install
sudo chmod +x ./install
sudo ./install auto
