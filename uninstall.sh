#! /bin/bash

NAME="auto_shutdown"
HANDLE_POWER_KEY="HandlePowerKey"
HANDLE_POWER_KEY_VALUE="poweroff"
HANDLE_HIBERNATE_KEY="HandleHibernateKey"
HANDLE_HIBERNATE_KEY_VALUE="hebirnate"
SYSTEMD_CONF="/etc/systemd/logind.conf"
CONFIG_TXT_PATH="/boot/config.txt"

# palette
red='\u001b[31m'
clear='\e[0m'

sudo update-rc.d -f auto_shutdown remove &
sudo rm /etc/init.d/$NAME.sh
sudo rm /usr/local/bin/$NAME.py

# config.txt
sudo sed -i "s/^dtoverlay=gpio-shutdown.*//" $CONFIG_TXT_PATH

echo -e $red"RPI AC Power watcher for x728 uninstalled"$clear