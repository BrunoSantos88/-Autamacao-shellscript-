#!/bin/bash
sudo yum -y install httpd
sudo systemctl enable httpd
sudo systemctl start httpd
sudo touch /var/www/html/index.html
sudo chmod 755 /var/www/html/index.html
sudo echo  > '<html><h1>Bruno Santos re/Start Project Work</h1></html>' > /var/www/html/index.html