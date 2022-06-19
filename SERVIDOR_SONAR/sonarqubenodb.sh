#!/bin/bash
apt-get update && apt-get -y upgrade
sudo apt install openjdk-11-jre-headless -y
sudo apt install wget -y
sudo apt install unzip -y
sudo apt install net-tools -y
sudo wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-9.5.0.56709.zip
sudo mv sonarqube-9.5.0.56709.zip /opt