#! /bin/bash

NAME="auto_shutdown"
HANDLE_POWER_KEY="HandlePowerKey"
HANDLE_POWER_KEY_VALUE="shutdown"
HANDLE_HIBERNATE_KEY="HandleHibernateKey"
HANDLE_HIBERNATE_KEY_VALUE="shutdown"
SYSTEMD_CONF="/etc/systemd/logind.conf"
CONFIG_TXT_PATH="/boot/config.txt"

# palette
green='\u001b[32m'
yellow='\u001b[33m'
red='\u001b[31m'
clear='\e[0m'

set -x

# install listener for startup
sudo cp $NAME.py /usr/local/bin/
sudo chmod +x /usr/local/bin/$NAME.py

sudo cp $NAME.sh /etc/init.d/
sudo chmod +x /etc/init.d/$NAME.sh

sudo update-rc.d $NAME.sh defaults
sudo /etc/init.d/$NAME.sh start

# systemd config
sudo sed -i "s/^$HANDLE_POWER_KEY.*\|^#$HANDLE_POWER_KEY.*/$HANDLE_POWER_KEY=$HANDLE_POWER_KEY_VALUE/" $SYSTEMD_CONF
sudo sed -i "s/^$HANDLE_HIBERNATE_KEY.*\|^#$HANDLE_HIBERNATE_KEY.*/$HANDLE_HIBERNATE_KEY=$HANDLE_HIBERNATE_KEY_VALUE/" $SYSTEMD_CONF

# config.txt
sudo sed -i "s/^dtoverlay=gpio-shutdown.*/dtoverlay=gpio-shutdown,gpio_pin=19,active_low=1,gpio_pull=down/" $CONFIG_TXT_PATH

echo -e $green"RPI AC Power watcher for x728 installed"$clear