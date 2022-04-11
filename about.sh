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
echo -e "       _____ ___    __  ____    ______  _   __   "
echo -e "      / ___//   |  /  |/  / |  / / __ \/ | / /   "
echo -e "      \__ \/ /| | / /|_/ /| | / / /_/ /  |/ /    "
echo -e "     ___/ / ___ |/ /  / / | |/ / ____/ /|  /     "
echo -e "    /____/_/  |_/_/  /_/  |___/_/   /_/ |_/      "
echo -e "               UNLIMITED SEGALANYA!              "
echo -e ""
echo -e "   ...........................................   "
echo -e "                  Build in 2021                  "
echo -e "               TELEGRAM : @coxoox               "
echo -e "================================================="
