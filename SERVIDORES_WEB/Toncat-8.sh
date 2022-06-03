#!/bin/bash
apt-get update && apt-get -y upgrade
sudo apt install openjdk-11-jdk -y
sudo apt-cache search tomcat -y
sudo apt install tomcat9 tomcat9-admin -y
