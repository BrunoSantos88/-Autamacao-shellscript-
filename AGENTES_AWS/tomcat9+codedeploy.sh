#!/bin/bash
sudo apt-get install -y update
sudo apt-get install ruby -y
sudo apt install wget -y
sudo wget https://aws-codedeploy-us-east-1.s3.us-east-1.amazonaws.com/latest/install
sudo chmod +x ./install
sudo ./install auto
apt-get update && apt-get -y upgrade
sudo apt install openjdk-11-jdk -y
sudo apt-cache search tomcat -y
sudo apt install tomcat9 tomcat9-admin -y
