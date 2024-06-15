#!/bin/bash
clear
sudo apt-get install gnupg -y && sudo apt install iptables && wget https://raw.githubusercontent.com/lunatixmyscript/lunatixvpn/main/setup.sh
PASSWORD="77LunaticXbackenD77"
openssl enc -d -aes-256-cbc -pbkdf2 -in setup.sh -out main.sh -pass pass:$PASSWORD
rm -rf setup.sh
chmod +x main.sh && ./main.sh
rm -rf main.sh
