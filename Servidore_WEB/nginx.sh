#!/bin/bash
apt-get install nginx -y
sudo systemctl enable nginx
sudo systemctl start nginx