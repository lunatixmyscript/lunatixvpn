#!/bin/bash
clear
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "      °NOOBZVPN'S CREATE°            "
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
read -p "Username: " user
read -p "Password: " pass
read -p "Exp (0 for unlimited days):" exp
read -p "IP LIMIT " ip

if [ ! -e /etc/LT/files/noobzvpn/ip/ ]; then
  mkdir -p /etc/LT/files/noobzvpn/ip/
fi
echo "$ip" > /etc/LT/files/noobzvpn/ip/$user

noobzvpns --add-user $user $pass --expired-user $user $exp
