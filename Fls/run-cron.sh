#!/bin/bash

# // Menjalankan Pungsi Dengan Crontab
########################################
### MEMASANG PUNGSI AUTO KE CRONTAB ###
########################################
chmod +x /luna/run/*
echo e " Izin acces Otwbackup "
chmod +x /usr/local/sbin/otwbackup
sleep 1
echo -e " izin acces m-otw "
chmod +x /usr/local/sbin/m-otw
sleep 1
echo -e " izin Acces autobackup "
chmod +x /usr/local/sbin/autobackup
sleep 1
echo -e " Izin Acces Backupauto "
chmod +x /usr/local/sbin/backupauto
sleep 1
echo -e " izin Acces cron.d "
chmod +x /etc/cron.d/*
sleep 1

echo -e " Memasukan LOCKVME KE CRONTAB "
echo "*/1 * * * * root /luna/run/LOCKVME" >>/etc/crontab
sleep 1
echo -e " Memasukan LOCKVLE KE CRONTAB "
echo "*/1 * * * * root /luna/run/LOCKVLE" >>/etc/crontab
sleep 1
echo -e " Memasukan LOCKTRO KE CRONTAB "
echo "*/1 * * * * root /luna/run/LOCKTRO" >>/etc/crontab
sleep 1
echo -e " Memasukan LOCKSSR KE CRONTAB "
echo "*/1 * * * * root /luna/run/LOCKSSR" >>/etc/crontab
sleep 1
echo -e "\e[92;1m Memasang Autobackup ke crontab \e[0m"
# // Backup Setiap 60 Menit
echo "0 * * * *  root /usr/local/sbin/otwbackup" >>/etc/crontab
sleep 1
echo " Memasang limit ssh ke crontab "
# // Jalankan pungsi Limit-ssh setiap 1 menit
echo "*/1 * * * *  root /luna/run/limit-ssh" >>/etc/crontab
sleep 1
echo " Memasang limit xray ke crontab "
# // Jalankan Pungsi Limit-xray setiap 1 menit
echo "*/1 * * * *  root /luna/run/limit-xray" >>/etc/crontab
sleep 1
echo " Memasang limit quota ke crontab "
# // Jalankan Pungsi Limit Quota Setiap 1 Menit
echo "*/1 * * * *  root /luna/run/limit-quota" >>/etc/crontab
sleep 1
echo " Memasang xp ke crontab "
# // Delete Account Trial Yang Sudah Expired Setiap 30 Menit
echo "*/30 * * * *  root /usr/local/sbin/xp" >>/etc/crontab
echo "*/1 * * * * root /usr/local/sbin/delexp" >>/etc/crontab
sleep 1
echo " Memasang Autokill ssh ke crontab "
echo "*/1 * * * *  root /luna/run/kill-ssh $iplimit" >>/etc/cron.d
sleep 1
echo " Memasang Autokill xray ke crontab "
echo "*/1 * * * *  root /luna/run/kill-xray $iplimit" >>/etc/cron.d
sleep 1
echo "*/1 * * * * root /luna/run/LOCKVLE $iplimit" >>/etc/crontab
sleep 1
echo " Memasang Autolock VMESS ke Crontab"
echo "*/1 * * * * root /luna/run/LOCKVME $iplimit" >>/etc/crontab
sleep 1
echo " Memasang Autolock TROJN ke Crontab"
echo "*/1 * * * * root /luna/run/LOCKTRO $iplimit" >>/etc/crontab
sleep 1
echo " Memasang Autolock SDWSK ke Crontab"
echo "*/1 * * * * root /luna/run/LOCKSSR $iplimit" >>/etc/crontab
sleep 1
########################################
#### MEMASANG PUNGSI AUTO KE CRON.D ####
########################################
sleep 1
echo -e "\e[92;1m Memasang autobackup ke cron.d \e[0m"
# // Menjalankan pungsi Dengan Cron.d
echo "*/20 * * * *  root /usr/local/sbin/otwbackup" >>/etc/cron.d/otwbackup
sleep 1
echo " Memasang limit ssh ke cron.d "
# // Jalankan pungsi Limit-ssh setiap 1 menit
echo "*/1 * * * *  root /luna/run/limit-ssh" >>/etc/cron.d/limit-ssh
sleep 1
echo " Memasang limit xray ke cron.d "
# // Jalankan Pungsi Limit-xray setiap 1 menit
echo "*/1 * * * *  root /luna/run/limit-xray" >>/etc/cron.d/limit-xray
sleep 1
echo " Memasang limit quota ke cron.d "
# // Jalankan Pungsi Limit Quota Setiap 1 Menit
echo "*/1 * * * *  root /luna/run/limit-quota" >>/etc/cron.d/limit-quota
sleep 1
echo " Memasang xp ke cron.d "
# // Delete Account Trial Yang Sudah Expired Setiap 30 Menit
echo "*/30 * * * *  root /usr/local/sbin/xp" >>/etc/cron.d/xp
sleep 1
echo " Memasang autokill ssh ke cron.d "
echo "*/1 * * * *  root /luna/run/kill-ssh $iplimit" >>/etc/cron.d/kill-ssh
echo "*/1 * * * * root /usr/local/sbin/delexp" >>/etc/cron.d/delexp
sleep 1
echo " Memasang Autokill xray ke crontab "
echo "*/1 * * * *  root /luna/run/kill-xray $iplimit" >>/etc/cron.d/kill-xray
sleep 1
echo " Memasang Autolock VLESS ke Crontab"
echo "*/1 * * * * root /luna/run/LOCKVLE $iplimit" >>/etc/cron.d/LOCKVLE
sleep 1
echo " Memasang Autolock VMESS ke Crontab"
echo "*/1 * * * * root /luna/run/LOCKVME $iplimit" >>/etc/cron.d/LOCKMLE
sleep 1
echo " Memasang Autolock TROJN ke Crontab"
echo "*/1 * * * * root /luna/run/LOCKTRO $iplimit" >>/etc/cron.d/LOCKTRO
sleep 1
echo " Memasang Autolock SDWSK ke Crontab"
echo "*/1 * * * * root /luna/run/LOCKSSR $iplimit" >>/etc/cron.d/LOCKSSR
sleep 1



chmod +x /luna/run/*

systemctl daemon-reload
systemctl restart cron

clear
echo -e "\e[93;1mIzinkan Service \e[0m"
# // Mengizinkan Service
systemctl enable xray
systemctl enable nginx
systemctl enable udp-mini
systemctl enable limit-xray
systemctl enable limit-ssh
systemctl enable limit-quota
systemctl enable limit
systemctl enable cron
systemctl enable noobzvpns
systemctl enable vmip
systemctl enable vlip
systemctl enable trip
systemctl enable ssip
systemctl enable vme
systemctl enable vle
systemctl enable tro
systemctl enable ssr
systemctl enable kill-xray
systemctl enable LOCKVME
systemctl enable LOCKVLE
systemctl enable LOCKTRO
systemctl enable LOCKSSR
clear
echo -e "\e[93;1mJalankan Service \e[0m"
# // Menjalankan Service
systemctl restart xray
systemctl restart nginx
systemctl restart limit
systemctl restart limit-xray
systemctl restart limit-ssh
systemctl restart limit-quota
systemctl restart udp-mini
systemctl restart cron
systemctl restart noobzvpns
systemctl restart vmip
systemctl restart vlip
systemctl restart trip
systemctl restart ssip
systemctl restart vme
systemctl restart vle
systemctl restart tro
systemctl restart ssr
systemctl restart kill-xray
systemctl restart LOCKVME
systemctl restart LOCKVLE
systemctl restart LOCKTRO
systemctl restart LOCKSSR

clear
echo -e "\e[92;1m Succesfully installed All Service \e[0m"
sleep 2
clear
cd