#!/bin/bash

wget http://stedolan.github.io/jq/download/linux64/jq
chmod +x ./jq
sudo mv jq /usr/local/bin

export SOURCES_PATH=$(pwd)

sudo useradd -m -g sudo $USER_NAME; echo -e "$USER_PASSWORD\n$USER_PASSWORD" | sudo passwd $USER_NAME

sudo apt-get -y -q update
sudo apt-get -y -q upgrade

sudo apt-get install mc git wget curl -y
#sudo debconf-set-selections <<< "mysql-server mysql-server/root_password password password"
#sudo debconf-set-selections <<< "mysql-server mysql-server/root_password_again password password"
#sudo apt install -y mysql-server
sudo apt-get install apache2 -y
sudo a2enmod rewrite
sudo apt-get install php-cli php-common php-json php-mysql php-mbstring php-gd php-curl php-zip libapache2-mod-php php-xml php-intl php-mongodb wget php-solr -y

# JAVA section; it is required for Eclipse and PhpStorm start
sudo apt-get -y -q install software-properties-common htop
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get -y -q update
sudo echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
sudo apt-get -y -q install oracle-java8-installer composer
sudo update-java-alternatives -s java-8-oracle

sudo apt-get install -y xfce4 virtualbox-guest-dkms virtualbox-guest-utils virtualbox-guest-x11
sudo VBoxClient --clipboard -d 
sudo VBoxClient --draganddrop -d 
sudo VBoxClient --display -d
sudo VBoxClient --checkhostversion -d
sudo VBoxClient --seamless -d

sudo apt-get install gnome-icon-theme-full tango-icon-theme
sudo cat "allowed_users=anybody" > /etc/X11/Xwrapper.config
	
sudo apt-get upgrade 
sudo apt-get install firefox -y

# section below is installing Eclipse
#sudo add-apt-repository ppa:ubuntu-desktop/ubuntu-make -y
# sudo apt update
# sudo apt install ubuntu-make -y
# umake ide eclipse

#curl -sS https://getcomposer.org/installer | php
#sudo mv composer.phar /usr/local/bin/composer

sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
sudo apt-add-repository 'deb https://apt.dockerproject.org/repo ubuntu-xenial main'
sudo apt-get update
#apt-cache policy docker-engine
sudo apt-get install -y docker-engine
sudo usermod -aG docker $USER_NAME
sudo apt-get install docker-compose -y

echo "Virtual machine is installed successfully"
sudo startxfce4&

