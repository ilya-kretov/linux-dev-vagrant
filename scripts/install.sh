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

sudo apt-get install \
    linux-image-extra-$(uname -r) \
    linux-image-extra-virtual -y

sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common -y

sudo apt-get update

sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt-get update

sudo apt-get install docker-ce -y

sudo usermod -aG docker $USER_NAME
sudo apt-get install docker-compose -y

cd
wget https://download.jetbrains.com/webide/PhpStorm-2017.2.4.tar.gz
tar -xvf PhpStorm-2017.2.4.tar.gz

if [ -d ~/Рабочий\ стол/ ]; then
    cd ~/Рабочий\ стол/
    ln -s ~/PhpStorm-172.4155.41/bin/phpstorm.sh
fi
if [ -d ~/Desktop/ ]; then
    cd ~/Desktop/
    ln -s ~/PhpStorm-172.4155.41/bin/phpstorm.sh
fi

echo "Virtual machine is installed successfully"
#sudo startxfce4&

