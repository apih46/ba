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
tls="$(cat ~/log-install.txt | grep -w "VMess GRPC TLS" | cut -d: -f2|sed 's/ //g')"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
		read -rp "User: " -e user
		CLIENT_EXISTS=$(grep -w $user /etc/v2ray/vmess.json | wc -l)

		if [[ ${CLIENT_EXISTS} == '1' ]]; then
			echo ""
			echo "A client with the specified name was already created, please choose another name."
			exit 1
		fi
	done
uuid=$(cat /proc/sys/kernel/random/uuid)
read -p "Expired (days): " masaaktif
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#vmessgrpc$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user""'"' /etc/v2ray/vmess.json
cat > /etc/v2ray/$user-tls.json << EOF
      {
      "v": "0",
      "ps": "${user}",
      "add": "${domain}",
      "port": "${tls}",
      "id": "${uuid}",
      "aid": "0",
      "net": "grpc",
      "path": "GunService",
      "type": "none",
      "host": "",
      "tls": "tls"
}
EOF
vmess_base641=$( base64 -w 0 <<< $vmess_json1)
vmesslink1="vmess://$(base64 -w 0 /etc/v2ray/$user-tls.json)"
systemctl restart vmess@grpc
systemctl restart cron
clear
echo -e ""
echo -e "==========-V2RAY/GRPC-=========="
echo -e "Remarks        : ${user}"
echo -e "Domain         : ${domain}"
echo -e "port TLS       : ${tls}"
echo -e "id             : ${uuid}"
echo -e "alterId        : 0"
echo -e "Encryption     : none"
echo -e "Network        : GRPC"
echo -e "ServiceName    : GunService"
echo -e "================================="
echo -e "Link GRPC      : ${vmesslink1}"
echo -e "================================="
echo -e "Expired On     : $exp"
