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

source /var/lib/premium-script/ipvps.conf
if [[ "$IP" = "" ]]; then
domain=$(cat /etc/v2ray/domain)
else
domain=$IP
fi
vl="$(cat ~/log-install.txt | grep -w "VLess GRPC TLS" | cut -d: -f2|sed 's/ //g')"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
		read -rp "User: " -e user
		CLIENT_EXISTS=$(grep -w $user /etc/v2ray/vles.json | wc -l)

		if [[ ${CLIENT_EXISTS} == '1' ]]; then
			echo ""
			echo "A client with the specified name was already created, please choose another name."
			exit 1
		fi
	done
uuid=$(cat /proc/sys/kernel/random/uuid)
read -p "Expired (days): " masaaktif
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#vlessgrpc$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/v2ray/vles.json
vlesslink1="vless://${uuid}@${domain}:${vl}?mode=gun&security=tls&encryption=none&type=grpc&serviceName=GunService&sni=example.com#$user"
systemctl restart vless@grpc.service > /dev/null 2>&1
clear
echo -e ""
echo -e "==========-V2RAY/GRPC-=========="
echo -e "Remarks        : ${user}"
echo -e "Domain         : ${domain}"
echo -e "Port TLS       : $vl"
echo -e "id             : ${uuid}"
echo -e "Encryption     : none"
echo -e "Network        : GRPC"
echo -e "ServiceName    : GunService"
echo -e "================================="
echo -e "link TLS       : ${vlesslink1}"
echo -e "================================="
echo -e "Expired On     : $exp"
