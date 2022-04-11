#!/bin/bash

MYIP=$(wget -qO- ipinfo.io/ip)
IZIN=$(curl -sS https://raw.githubusercontent.com/apih46/ip/main/list | awk '{print $4}' | grep $MYIP)
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

Green_font_prefix="\033[32m" && Red_font_prefix="\033[31m" && Green_background_prefix="\033[42;37m" && Red_background_prefix="\033[41;37m" && Font_color_suffix="\033[0m"
Info="${Green_font_prefix}[ON]${Font_color_suffix}"
Error="${Red_font_prefix}[OFF]${Font_color_suffix}"
cek=$(cat /home/limit)
NIC=$(ip -o $ANU -4 route show to default | awk '{print $5}')
function start() {
    echo -e "Limit Speed All Service"
    read -p "Set maximum download rate (in Kbps): " down
    read -p "Set maximum upload rate (in Kbps): " up
    if [[ -z "$down" ]] && [[ -z "$up" ]]; then
        echo >/dev/null 2>&1
    else
        echo "Start Configuration"
        sleep 0.5
        wondershaper -a $NIC -d $down -u $up >/dev/null 2>&1
        systemctl enable --now wondershaper.service
        echo "start" >/home/limit
        echo "Done"
    fi
}
function stop() {
    wondershaper -ca $NIC
    systemctl stop wondershaper.service
    systemctl disable wondershaper.service
    echo "Stop Configuration"
    sleep 0.5
    echo >/home/limit
    echo "Done"
}
if [[ "$cek" = "start" ]]; then
    sts="${Info}"
else
    sts="${Error}"
fi
clear
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\E[44;1;39m     ⇱ Limit Bandwidth Speed ⇲     \E[0m"
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e " Status $sts"
echo -e "  1. Start Limit"
echo -e "  2. Stop Limit"
echo -e ""
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
read -rp " Please Enter The Correct Number : " -e num
if [[ "$num" = "1" ]]; then
    start
elif [[ "$num" = "2" ]]; then
    stop
else
    clear
    echo " You Entered The Wrong Number"
    setting-menu
fi

S
