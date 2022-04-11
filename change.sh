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

echo -e ""
echo -e "======================================"
echo -e ""
echo -e "     [1]  Change Port Stunnel4"
echo -e "     [2]  Change Port OpenVPN"
echo -e "     [3]  Change Port Wireguard"
echo -e "     [4]  Change Port Vmess"
echo -e "     [5]  Change Port VMess GRPC"
echo -e "     [6]  Change Port Vless"
echo -e "     [7]  Change Port VLess GRPC"
echo -e "     [8]  Change Port Trojan"
echo -e "     [9]  Change Port TRojan GRPC"
echo -e "     [10]  Change Port Squid"
echo -e "     [11]  Change Port SSTP"
echo -e "     [12]  Change Port XRAY"

echo -e "     [x]  Exit"
echo -e "======================================"
echo -e ""
read -p "     Select From Options [1-9 or x] :  " port
echo -e ""
case $port in
1)
port-ssl
;;
2)
port-ovpn
;;
3)
port-wg
;;
4)
port-ws
;;
5)
port-wspc
;;
6)
port-vless
;;
7)
port-vlpc
;;
8)
port-trojan
;;
9)
port-trpc
;;
10)
port-squid
;;
11)
port-sstp
;;
12)
port-xray 
;;
x)
clear
menu
;;
*)
echo "Please enter an correct number"
;;
esac
