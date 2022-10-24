#! /bin/bash

NAME="auto_shutdown"
HANDLE_POWER_KEY="HandlePowerKey"
HANDLE_POWER_KEY_VALUE="ignore"
HANDLE_HIBERNATE_KEY="HandleHibernateKey"
HANDLE_HIBERNATE_KEY_VALUE="hibernate"
SYSTEMD_CONF="/etc/systemd/logind.conf"
CONFIG_TXT_PATH="/boot/config.txt"

# palette
green='\u001b[32m'
clear='\e[0m'

set -x

# install listener for startup
sudo cp $NAME.py /usr/local/bin/
sudo chmod +x /usr/local/bin/$NAME.py

sudo cp $NAME.sh /etc/init.d/
sudo chmod +x /etc/init.d/$NAME.sh

sudo update-rc.d $NAME.sh defaults
sudo /etc/init.d/$NAME.sh start

# config.txt
sudo sed -i "s/^dtoverlay=gpio-shutdown.*/dtoverlay=gpio-shutdown/" $CONFIG_TXT_PATH

echo -e $green"RPI AC Power watcher for x728 installed"$clear