#!/bin/bash
sudo yum install httpd -y
sudo systemctl start httpd
sudo touch /var/www/html/index.html
echo "Dadada" | sudo tee -a /var/www/html/index.html
sudo firewall-cmd --zone=public --permanent --add-port=80/tcp
sudo firewall-cmd --reload
