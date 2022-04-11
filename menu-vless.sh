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
echo -e "\E[44;1;39m                      V2RAY VLESS MENU                        \E[0m"
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
echo -e "\033[0;34m    * [1]\e[0m: Create V2RAY Vless Websocket Account\e[0m"
echo -e "\033[0;34m    * [2]\e[0m: Deleting V2RAY Vless Websocket Account\e[0m"
echo -e "\033[0;34m    * [3]\e[0m: Extending Vless Account Active Life\e[0m"
echo -e "\033[0;34m    * [4]\e[0m: Check User Login V2RAY\e[0m"
echo -e ""
source /root/.ctech/banner
banner
echo -e ""
read -p "        Select From Options [1-4 or x]: " menuvless
echo -e ""
case $menuvless in
1)
add-vless
;;
2)
del-vless
;;
3)
renew-vless
;;
4)
cek-vless
;;
x)
menu
;;
*)
menu
;;
esac
