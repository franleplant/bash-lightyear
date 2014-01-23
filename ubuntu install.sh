#!/bin/bash


sudo apt-get update
sudo apt-get -y install python-software-properties


echo "


INSTALL APACHE 2


"


sudo apt-get -y install apache2
sudo apt-get -y install libapache2-mod-php5
sudo a2enmod php5
sudo chmod -R 777 /var/www/

echo "


INSTALL PHP 5.3


"
sudo add-apt-repository ppa:bjori/php5
sudo apt-get update
sudo aptitude -y install php5 php5-cli
sudo apt-get update

echo "


INSTALL GIT 1.8.2


"


sudo add-apt-repository ppa:git-core/ppa
sudo apt-get update
sudo apt-get -y install git

echo "


INSTALL VIM


"
sudo apt-get -y install vim


echo "


INSTALL SAMBA


"
sudo apt-get -y install samba



echo "


MISC TASKs


"

#if you are doing this by hand, just copy the text between " " into the tail of /etc/samba/smb.conf
sudo echo "[www]
path = /var/www
available = yes
valid users = vagrant
read only = no
browsable = yes
public = yes
writable = yes" >> /etc/samba/smb.conf




echo "10.151.34.60 gh.riotgames.com" >> /etc/hosts



cd /etc/apache2/sites-available/
sudo touch signup1
sudo echo "<VirtualHost *:80>
        ServerAdmin admin@localhost.com
        Servername http://signup1
        DocumentRoot /var/www/signup1/app/webroot
        <Directory />
                Options FollowSymLinks
                AllowOverride All
        </Directory>
        <Directory /var/www/signup1/app/webroot>
                Options Indexes FollowSymLinks MultiViews
                AllowOverride All
                DirectoryIndex index.php index.html
                Order allow,deny
                allow from all
        </Directory>
        # Possible values include: debug, info, notice, warn, error, crit,
        # alert, emerg.
        LogLevel warn

        ErrorLog /var/log/apache2/signup1-error.log
        CustomLog /var/log/apache2/signup1-access.log combined
</VirtualHost>" >> signup1




cd /var/www
sudo touch info.php
echo "<?php
phpinfo();
?>" > info.php

echo "


        Automatic Installation has ended.

        Please see README.md a follow the manual instructions to finish
        the instalation process.


        F!


"



