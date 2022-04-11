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
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\E[44;1;39m                       SSH/OVPN MENU                          \E[0m"
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
echo -e "\033[0;34m    * [1]\e[0m  \e[1;32m: Create SSH & OpenVPN Account\e[0m"
echo -e "\033[0;34m    * [2]\e[0m  \e[1;32m: Generate SSH & OpenVPN Trial Account\e[0m"
echo -e "\033[0;34m    * [3]\e[0m  \e[1;32m: Extending SSH & OpenVPN Account Active Life\e[0m"
echo -e "\033[0;34m    * [4]\e[0m  \e[1;32m: Delete SSH & OpenVPN Account\e[0m"
echo -e "\033[0;34m    * [5]\e[0m  \e[1;32m: Check User Login SSH & OpenVPN\e[0m"
echo -e "\033[0;34m    * [6]\e[0m  \e[1;32m: Daftar Member SSH & OpenVPN\e[0m"
echo -e "\033[0;34m    * [7]\e[0m  \e[1;32m: Delete User Expired SSH & OpenVPN\e[0m"
echo -e "\033[0;34m    * [8]\e[0m  \e[1;32m: Set up Autokill SSH\e[0m"
echo -e "\033[0;34m    * [9]\e[0m  \e[1;32m: Displays Users Who Do Multi Login SSH\e[0m"
echo -e "\033[0;34m    * [10]\e[0m: Restart Service Dropbear, Squid3, OpenVPN dan SSH\e[0m"
echo -e ""
source /root/.ctech/banner
banner
echo -e ""
read -p "        Select From Options [1-10 or x]: " menussh
echo -e ""
case $menussh in
1)
usernew
;;
2)
trial
;;
3)
renew
;;
4)
deluser
;;
5)
cek
;;
6)
member
;;
7)
delete 
;;
8)
autokill
;;
9)
ceklim 
;;
10)
restart 
;;
x)
menu
;;
*)
menu
;;
esac
