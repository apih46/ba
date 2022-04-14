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
versi=$(cat /home/ver)
if [[ $versi == 1.2 ]]; then
echo "You Have The Latest Version"
exit 0
fi
echo "Start Update"
cd /usr/bin
wget -O menu "https://raw.githubusercontent.com/apih46/ba/main/menu.sh"
wget -O usernew "https://raw.githubusercontent.com/apih46/ba/main/usernew.sh"
wget -O trial "https://raw.githubusercontent.com/apih46/ba/main/trial.sh"
wget -O change-port "https://raw.githubusercontent.com/apih46/ba/main/change.sh"
wget -O port-ovpn "https://raw.githubusercontent.com/apih46/ba/port-ovpn.sh"
wget -O port-ssl "https://raw.githubusercontent.com/apih46/ba/port-ssl.sh"
wget -O port-wg "https://raw.githubusercontent.com/apih46/ba/port-wg.sh"
wget -O port-tr "https://raw.githubusercontent.com/apih46/ba/port-tr.sh"
wget -O port-sstp "https://raw.githubusercontent.com/apih46/ba/port-sstp.sh"
wget -O port-squid "https://raw.githubusercontent.com/apih46/ba/port-squid.sh"
wget -O port-ws "https://raw.githubusercontent.com/apih46/ba/port-ws.sh"
wget -O port-vless "https://raw.githubusercontent.com/apih46/ba/port-vless.sh"
wget -O wbmn "https://raw.githubusercontent.com/apih46/ba/webmin.sh"
wget -O xp "https://raw.githubusercontent.com/apih46/ba/xp.sh"
wget -O limit-speed "https://raw.githubusercontent.com/apih46/ba/limit-speed.sh"
wget -O add-sstp "https://raw.githubusercontent.com/apih46/ba/add-sstp.sh"
wget -O add-ws "https://raw.githubusercontent.com/apih46/ba/add-ws.sh"
wget -O add-vless "https://raw.githubusercontent.com/apih46/ba/add-vless.sh"
wget -O add-tr "https://raw.githubusercontent.com/apih46/ba/add-tr.sh"
chmod +x change-port
chmod +x port-ovpn
chmod +x port-ssl
chmod +x port-wg
chmod +x port-sstp
chmod +x port-tr
chmod +x port-squid
chmod +x port-ws
chmod +x port-vless
chmod +x wbmn
chmod +x xp
chmod +x limit-speed
echo "0 5 * * * root clear-log && reboot" > /etc/crontab
echo "0 0 * * * root xp" > /etc/crontab
cd
echo "1.2" > /home/ver
clear
echo " Fix minor Bugs"
echo " Now You Can Change Port Of Some Services"
echo " Reboot 5 Sec"
sleep 5
rm -f update.sh
reboot
