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

tls="$(cat ~/log-install.txt | grep -w "VLess GRPC TLS" | cut -d: -f2|sed 's/ //g')"
echo -e "======================================"
echo -e ""
echo -e "     [1]  Change Port Vless GRPC TLS $tls"
echo -e "     [x]  Exit"
echo -e "======================================"
echo -e ""
read -p "     Select From Options [1 or x] :  " prot
echo -e ""
case $prot in
1)
read -p "New Port Vless TLS: " tls1
if [ -z $tls1 ]; then
echo "Please Input Port"
exit 0
fi
cek=$(netstat -nutlp | grep -w $tls1)
if [[ -z $cek ]]; then
sed -i "s/$tls/$tls1/g" /etc/v2ray/vles.json
sed -i "s/   - V2RAY VLess GRPC TLS    : $tls/   - V2RAY VLess GRPC TLS    : $tls1/g" /root/log-install.txt
iptables -D INPUT -m state --state NEW -m tcp -p tcp --dport $tls -j ACCEPT
iptables -D INPUT -m state --state NEW -m udp -p udp --dport $tls -j ACCEPT
iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport $tls1 -j ACCEPT
iptables -I INPUT -m state --state NEW -m udp -p udp --dport $tls1 -j ACCEPT
iptables-save > /etc/iptables.up.rules
iptables-restore -t < /etc/iptables.up.rules
netfilter-persistent save > /dev/null
netfilter-persistent reload > /dev/null
systemctl restart vless@grpc > /dev/null
echo -e "\e[032;1mPort $tls1 modified successfully\e[0m"
else
echo "Port $tls1 is used"
fi
;;
x)
exit
menu
;;
*)
echo "Please enter an correct number"
;;
esac
