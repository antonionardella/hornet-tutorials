#!/bin/bash
sudo apt update && sudo apt upgrade --assume-yes && \
wget -qO - https://ppa.hornet.zone/pubkey.txt | sudo apt-key add - && \
sudo sh -c 'echo "deb http://ppa.hornet.zone stable main" >> /etc/apt/sources.list.d/hornet.list' && \
sudo apt update && sudo apt install --assume-yes hornet ufw sudo fail2ban && \
ufw allow outcoming && ufw deny incoming && ufw allow ssh && ufw allow 14626/udp && ufw allow 15600/tcp && \
adduser beekeeper && usermod -aG sudo beekeeper && \
sudo systemctl start fail2ban && sudo systemctl enable fail2ban
