#!/bin/bash
sudo yum -y update
sudo amazon-linux-extras install nginx1 -y
sudo systemctl start nginx
sudo yum -y install ruby
sudo yum -y install wget
wget https://aws-codedeploy-us-east-1.s3.us-east-1.amazonaws.com/latest/install
sudo chmod +x ./install
sudo ./install auto
