#!/bin/bash

MYIP=$(wget -qO- ipinfo.io/ip);
IZIN=$( curl -sS https://raw.githubusercontent.com/apih46/ip/main/list | awk '{print $4}' | grep $MYIP )
if [ $MYIP = $IZIN ]; then
clear
echo -e "${green}Tahniah! Anda Dibenarkan menggunakan LukaVPN...${NC}"
else
clear
echo ""
rm -f setup.sh
echo '                            ...                           '
echo '        Anda Tidak Dibenarkan Menggunakan Script ini!     '
echo '                            ...                           '
echo '        SILA REGISTER IP ANDA DI BOT @LukaVpn_bot!     '
echo '                        t.me/coxoox                      '
sleep 20
exit 0
fi
clear

clear
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
CITY=$(curl -s ipinfo.io/city )
WKT=$(curl -s ipinfo.io/timezone )
IPVPS=$(curl -s ipinfo.io/ip )
DOMAIN=$(cat /etc/v2ray/domain)
jam=$(date +"%T")
hari=$(date +"%A")
tnggl=$(date +"%d-%B-%Y")
NAME=$(curl -sS https://raw.githubusercontent.com/apih46/ip/main/list | grep $IPVPS | awk '{print $2}')
EXP=$(curl -sS https://raw.githubusercontent.com/apih46/ip/main/list | grep $IPVPS | awk '{print $3}')
echo -e "\033[0;35m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "    * IP VPS         : $IPVPS"
echo -e "    * SERVER         : $ISP"
echo -e "    * CLIENT NAME    : $NAME"
echo -e "    * EXP     SCRIPT : $EXP"
echo -e "    * SERVER NAME    : \033[0;92m$DOMAIN"
echo -e "\e[0m                                                               "
echo -e ""
source /root/.ctech/banner
banner
echo -e ""
echo -e "\e[0m                                                               "
echo -e "\033[0;92m    * [1]\e[0m  : SSH & OVPN PANEL\e[0m"
echo -e "\033[0;93m    * [2]\e[0m  : XRAY PANEL PANEL\e[0m"
echo -e "\033[0;95m    * [3]\e[0m  : CREATE OPENVPN ACCOUNT\e[0m"
echo -e "\033[0;96m    * [4]\e[0m  : TRIAL OPENVPN ACCOUNT\e[0m"
echo -e "\033[0;94m    * [6]\e[0m  : SSR PANEL\e[0m"
echo -e "\033[0;92m    * [7]\e[0m  : SHADOWSOCKS PANEL\e[0m"
echo -e "\033[0;93m    * [8]\e[0m  : VMESS PANEL\e[0m"
echo -e "\033[0;94m    * [9]\e[0m  : VMESS GRPC PANEL\e[0m"
echo -e "\033[0;95m    * [10]\e[0m : VLESS PANEL\e[0m"
echo -e "\033[0;96m    * [11]\e[0m : VLESS GRPC PANEL\e[0m"
echo -e "\033[0;92m    * [12]\e[0m : WIREGUARD\e[0m"
echo -e "\033[0;93m    * [13]\e[0m : TROJAN PANEL\e[0m"
echo -e "\033[0;94m    * [14]\e[0m : TROJAN GRPC PANEL\e[0m"
echo -e "\033[0;91m━━━━━━\e[0;92m━━━━━━\e[0;93m━━━━━━\e[0;94━━━━━━━━\e[0;95m━━━━━━━━\e[0;96m━━━━━━━━━━\033[0;97m━━━━━━━━━━━━━━━━━━\033[0m" 
echo -e "\033[0;95m    * [15]\e[0m : Add Or Change Subdomain Host For VPS\e[0m"
echo -e "\033[0;96m    * [16]\e[0m : Renew Certificate \e[0m"
echo -e "\033[0;92m    * [17]\e[0m : Change Port Of Some Service\e[0m"
echo -e "\033[0;93m    * [18]\e[0m : Autobackup Data VPS\e[0m"
echo -e "\033[0;94m    * [19]\e[0m : Backup Data VPS\e[0m"
echo -e "\033[0;95m    * [20]\e[0m : Restore Data VPS\e[0m"
echo -e "\033[0;96m    * [21]\e[0m : Webmin Menu\e[0m"
echo -e "\033[0;92m    * [22]\e[0m : Update To Latest Kernel\e[0m"
echo -e "\033[0;93m    * [23]\e[0m : Limit Bandwith Speed Server\e[0m"
echo -e "\033[0;94m    * [25]\e[0m : Reboot VPS\e[0m"
echo -e "\033[0;95m    * [26]\e[0m : Speedtest VPS\e[0m"
echo -e "\033[0;96m    * [27]\e[0m : Update To Latest Script Version\e[0m"
echo -e "\033[0;92m    * [28]\e[0m : Displaying System Information\e[0m"
echo -e "\033[0;93m    * [29]\e[0m : Info Script Auto Install\e[0m"
echo -e "\033[0;94m    * [30]\e[0m : Change Vps Banner \e[0m"
echo -e "\033[0;95m    * [31]\e[0m : Exit From VPS \e[0m"
echo -e "\e[0m                                                               "
echo -e ""
read -p "        Select From Options [1-31 or x]: " menu
echo -e ""
case $menu in
1)
menu-ssh
;;
2)
menu-xray
;;
3)
usernew
;;
4)
trial
;;
6)
menu-ssr
;;
7)
menu-ss 
;;
8)
menu-vmess
;;
9)
menu-vmpc
;;
10)
menu-vless 
;;
11)
menu-vlpc  
;;
12)
menu-wg
;;
13)
menu-trojan
;;
14)
menu-trpc
;;
15)
add-host
;;
16)
certv2ray
;;
17)
change-port
;;
18)
autobackup
;;
19)
backup
;;
20)
restore
;;
21)
wbmn
;;
22)
kernel-updt
;;
23)
limit-speed
;;
25)
reboot
;;
26)
speedtest-cli
;;
27)
update
;;
28)
info
;;
29)
about
;;
30)
change-banner
;;
31)
exit
;;
x)
exit
menu
;;
*)
menu
;;
esac
