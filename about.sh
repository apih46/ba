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
echo -e "================================================="
echo -e "#         Premium Auto Script By LukaVPN         #"
echo -e "================================================="
echo '        _          _       __     ______  _   _         '
echo '       | |   _   _| | ____ \ \   / /  _ \| \ | |        '
echo '       | |  | | | | |/ / _` \ \ / /| |_) |  \| |        '
echo '       | |__| |_| |   < (_| |\ V / |  __/| |\  |        '
echo '       |_____\__,_|_|\_\__,_| \_/  |_|   |_| \_|        '
echo -e ""
echo -e "   ...........................................   "
echo -e "                  Build in 2021                  "
echo -e "               TELEGRAM : @coxoox               "
echo -e "================================================="
