clear
echo -e "\033[1;93m─────────────────────────────────────────\033[0m"
echo -e "\e[42m       Renew Xray/vmess Account          \E[0m"
echo -e "\033[1;93m─────────────────────────────────────────\033[0m"
echo ""
grep -E "^#vme-user# " "/etc/xray/vme.json" | cut -d ' ' -f 2-3 | column -t | sort | uniq
echo ""
echo -e "\033[1;93m─────────────────────────────────────────\033[0m"
read -rp "Input Username : " user
    if [ -z $user ]; then
    menu-trojan
    else
    rm -f /etc/lunatic/limit/trojan/ip/${user}
    rm -f /etc/lunatic/limit/trojan/quota/$user
    read -p "Expired (days): " masaaktif
    read -p "Limit User (GB): " Quota
    read -p "Limit User (IP): " iplim
    exp=$(grep -wE "^#vme-user# $user" "/etc/xray/vme.json" | cut -d ' ' -f 3 | sort | uniq)
    mkdir -p /etc/lunatic/limit/vmess/ip
echo $iplim > /etc/lunatic/limit/vmess/ip/${user}
if [ ! -e /etc/vmess/ ]; then
  mkdir -p /etc/vmess/
 touch /etc/vmess/$user
fi


if [ -z ${Quota} ]; then
  Quota="0"
fi

c=$(echo "${Quota}" | sed 's/[^0-9]*//g')
d=$((${c} * 1024 * 1024 * 1024))

if [[ ${c} != "0" ]]; then
  echo "${d}" >/etc/lunatic/limit/vmess/quota/${user}
fi
    now=$(date +%Y-%m-%d)
    d1=$(date -d "$exp" +%s)
    d2=$(date -d "$now" +%s)
    exp2=$(( (d1 - d2) / 86400 ))
    exp3=$(($exp2 + $masaaktif))
    exp4=`date -d "$exp3 days" +"%Y-%m-%d"`
    sed -i "/#vme-user# $user/c\#vme-user# $user $exp4" /etc/xray/vme.json
   # sed -i "/#! $user/c\#vme-user# $user $exp4" /root/akun/trojan/.trojan.conf
    systemctl restart xray > /dev/null 2>&1
    clear
    echo -e "\033[1;93m─────────────────────────────────────────\033[0m"
    echo " Vmess Account Was Successfully Renewed"
    echo -e "\033[1;93m─────────────────────────────────────────\033[0m"
    echo ""
    echo " Client Name : $user"
    echo " Expired On  : $exp4"
    echo ""
    echo -e "\033[1;93m─────────────────────────────────────────\033[0m"
    echo ""
    #read -n 1 -s -r -p "Press [ Enter ] to back on menu"
    #menu
fi
