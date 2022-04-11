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

uuid=$(cat /etc/trojan/uuid.txt)
source /var/lib/premium-script/ipvps.conf
if [[ "$IP" = "" ]]; then
domain=$(cat /etc/v2ray/domain)
else
domain=$IP
fi
tr=$(cat /etc/v2ray/trojan.json | grep -w port | awk '{print $2}' | sed 's/,//g')
until [[ $username =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
		read -rp "user: " -e username
		CLIENT_EXISTS=$(grep -w $username /etc/v2ray/trojan.json | wc -l)

		if [[ ${CLIENT_EXISTS} == '1' ]]; then
			echo ""
			echo "A client with the specified name was already created, please choose another name."
			exit 1
		fi
	done
uuid=$(cat /proc/sys/kernel/random/uuid)
read -p "Expired (days): " masaaktif
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#tr$/a\### '"$username $exp"'\
},{"password": "'""$username""'","email": "'""$username""'"' /etc/v2ray/trojan.json
trojanlink="trojan://${username}@${domain}:${tr}/?security=tls&type=grpc&serviceName=GunService&sni=example.com#$username"
systemctl restart trojan@grpc.service > /dev/null 2>&1
clear
echo -e ""
echo -e "=============-TGRPC-============"
echo -e "Remarks        : ${username}"
echo -e "Host/IP        : ${domain}"
echo -e "port           : ${tr}"
echo -e "Key            : ${username}"
echo -e "Link           : ${trojanlink}"
echo -e "================================="
echo -e "Expired On     : $exp"
