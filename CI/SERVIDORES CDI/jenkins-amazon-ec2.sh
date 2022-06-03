#/bin/bash
sudo yum update
sudo yum amazon-linux-extras
sudo yum install java-1.8.0-openjdk-devel maven -y
sudo tee /etc/yum.repos.d/jenkins.repo<<EOF
[jenkins]
name=Jenkins
baseurl=http://pkg.jenkins.io/redhat
gpgcheck=0
EOF
sudo rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key
sudo yum repolist
sudo yum install jenkins -y
sudo systemctl start jenkins
sudo systemctl enable jenkins