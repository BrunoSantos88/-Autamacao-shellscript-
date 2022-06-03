#!/bin/bash 
yum -y update
yum -y install httpd php mysql php-mysql
amazon-linux-extras install -y lamp-mariadb10.2-php7.2 php7.2
yum install -y httpd mariadb-server
/usr/bin/systemctl enable httpd
/usr/bin/systemctl start httpd
cd /var/www/html
#wget https://aws-tc-largeobjects.s3.amazonaws.com/ILT-TF-100-TUFOUN-1/5-lab-database-server/lab-app-php7.zip
wget https://aws-tc-largeobjects.s3.us-west-2.amazonaws.com/CUR-TF-100-RESTRT-1/160-lab-DF-database-server/s3/lab-app-php7.zip
unzip lab-app-php7.zip -d /var/www/html/
chown apache:root /var/www/html/rds.conf.php