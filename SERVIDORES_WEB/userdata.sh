#!/bin/bash
sudo apt-get update -y
sudo apt-get install -y apache2
sudo apt install -y php php-cli php-mysql php-common php-zip php-mbstring php-xmlrpc php-curl php-soap php-gd php-xml php-intl php-ldap wget unzip git binutils
sudo apt install -y libapache2-mod-php
sudo systemctl start apache2
sudo systemctl enable apache2
sudo wget http://pages.cloudtreinamentos.com/aws/arquivos/teste.php
sudo cp teste.php /var/www/html/
sudo apt install awscli -y
release_tag=$(curl -s https://api.github.com/repos/Dolibarr/dolibarr/releases/latest | grep tag_name | cut -d '"' -f 4)
wget https://github.com/Dolibarr/dolibarr/archive/${release_tag}.tar.gz
tar xvf ${release_tag}.tar.gz
sudo rm /var/www/html/index.html
sudo mv dolibarr-${release_tag}/htdocs/* /var/www/html
sudo chown -R www-data:www-data /var/www/html
wget https://aws-codedeploy-us-east-1.s3.us-east-1.amazonaws.com/latest/install
chmod +x ./install
sudo ./install auto > /tmp/logfile
mkdir /var/www/html/documents
git clone https://github.com/aws/efs-utils
cd efs-utils/
./build-deb.sh
sudo apt-get -y install ./build/amazon-efs-utils*deb
sudo su
echo "fs-09a4f43a21cd67a4d.efs.us-east-1.amazonaws.com:/ /var/www/html/documents nfs4 nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,noresvport,_netdev 0 0" >> /etc/fstab
mount -a
chown www-data:www-data /var/www/html/documents
chmod 700 /var/www/html/documents