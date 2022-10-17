#! /bin/bash

NAME="auto_shutdown"
HANDLER="HandleHibernateKey"
HANDLER_OPTION="shutdown"
SYSTEMD_CONF="etc/systemd/logind.conf"

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
sudo sed -i "s/^$HANDLER.*\|^#$HANDLER.*/$HANDLER=$HANDLER_OPTION/" /$SYSTEMD_CONF

echo -e $green"RPI AC Power watcher for x728 installed"$clear