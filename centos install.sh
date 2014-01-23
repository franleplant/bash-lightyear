#!/bin/bash

echo "Installing dependencies"

# resolve DNS server issue with CentOS
# 8.8.8.8 is Google public DNS server

# remove current DNS
head -n -1 /etc/resolv.conf > /etc/resolv.conf.tmp
mv -f /etc/resolv.conf.tmp /etc/resolv.conf
# add Google DNS
echo "nameserver 8.8.8.8" >> /etc/resolv.conf


#Preliminars

# Make chkconfig globally available

sudo ln -s /sbin/chkconfig /usr/bin

# Make service globally available

sudo ln -s /sbin/service /usr/bin

sudo yum clean all
sudo yum update


echo "Installing: MYSQL"

sudo yum -y install mysql mysql-server

# tell the system to start mysql on startup
sudo chkconfig --levels 235 mysqld on

#start mysql service
sudo service mysqld start

#you should probably run later
#mysql_secure_installation



echo "Installing: APACHE"

sudo yum -y install httpd

#tell the system to start apache on startup
sudo chkconfig --levels 235 httpd on

#start apache service

sudo service httpd start




echo "Installing: PHP 5.4"


#add centos 5.x repository for PHP 5.4
sudo rpm -Uvh http://mirror.webtatic.com/yum/el5/latest.rpm

#install php 5.3
sudo yum -y install php53

sudo yum install php53-mysql php53-gd



echo "Misc. Installs"
echo "Installing: wget"

sudo yum -y install wget


echo "Install git"

sudo yum -y install zlib-devel openssl-devel cpio expat-devel gettext-devel curl-devel

cd /usr/local/src
wget -O git.tar.gz https://codeload.github.com/git/git/tar.gz/v1.8.4.2
tar xvzf git.tar.gz
cd git-1.8.4.2
sudo make
sudo make install


http://www.konordo.com/blog/installing-git-centos-55-yum