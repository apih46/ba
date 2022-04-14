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

# By syfqsam
#
# ==================================================
# initializing var
export DEBIAN_FRONTEND=noninteractive
MYIP=$(wget -qO- ipinfo.io/ip);
MYIP2="s/xxxxxxxxx/$MYIP/g";
NET=$(ip -o $ANU -4 route show to default | awk '{print $5}');
source /etc/os-release
ver=$VERSION_ID

#detail nama perusahaan
country=MY
state=Malaysia
locality=Malaysia
organization=syfqsam.xyz
organizationalunit=syfqsam.xyz
commonname=syfqsam.xyz
email=admin@syfqsam.xyz

# simple password minimal
wget -O /etc/pam.d/common-password "https://raw.githubusercontent.com/apih46/ba/main/password"
chmod +x /etc/pam.d/common-password

# go to root
cd

# Edit file /etc/systemd/system/rc-local.service
cat > /etc/systemd/system/rc-local.service <<-END
[Unit]
Description=/etc/rc.local
ConditionPathExists=/etc/rc.local
[Service]
Type=forking
ExecStart=/etc/rc.local start
TimeoutSec=0
StandardOutput=tty
RemainAfterExit=yes
SysVStartPriority=99
[Install]
WantedBy=multi-user.target
END

# nano /etc/rc.local
cat > /etc/rc.local <<-END
#!/bin/sh -e
# rc.local
# By default this script does nothing.
exit 0
END

# Ubah izin akses
chmod +x /etc/rc.local

# enable rc local
systemctl enable rc-local
systemctl start rc-local.service

# disable ipv6
echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6
sed -i '$ i\echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6' /etc/rc.local

#update
apt update -y
apt upgrade -y
apt dist-upgrade -y
apt-get remove --purge ufw firewalld -y
apt-get remove --purge exim4 -y

# install wget and curl
apt -y install wget curl

# set time GMT +8
ln -fs /usr/share/zoneinfo/Asia/Malaysia /etc/localtime

# set locale
sed -i 's/AcceptEnv/#AcceptEnv/g' /etc/ssh/sshd_config

# install
apt-get --reinstall --fix-missing install -y bzip2 gzip coreutils wget screen rsyslog iftop htop net-tools zip unzip wget net-tools curl nano sed screen gnupg gnupg1 bc apt-transport-https build-essential dirmngr libxml-parser-perl neofetch git lsof
echo "clear" >> .profile
echo "neofetch --ascii_distro Minix" >> .profile










# install webserver
apt -y install nginx
cd
rm /etc/nginx/sites-enabled/default
rm /etc/nginx/sites-available/default
wget -O /etc/nginx/nginx.conf "https://raw.githubusercontent.com/apih46/ba/main/nginx.conf"
mkdir -p /home/vps/public_html
wget -O /etc/nginx/conf.d/vps.conf "https://raw.githubusercontent.com/apih46/ba/main/vps.conf"
/etc/init.d/nginx restart

# install badvpn
cd
wget -O /usr/bin/badvpn-udpgw "https://raw.githubusercontent.com/apih46/ba/main/badvpn-udpgw64"
chmod +x /usr/bin/badvpn-udpgw
sed -i '$ i\screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7100 --max-clients 500' /etc/rc.local
sed -i '$ i\screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7200 --max-clients 500' /etc/rc.local
sed -i '$ i\screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 500' /etc/rc.local
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7100 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7200 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7400 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7500 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7600 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7700 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7800 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7900 --max-clients 500

# setting port ssh
sed -i 's/Port 22/Port 22/g' /etc/ssh/sshd_config

# install dropbear
apt -y install dropbear
sed -i 's/NO_START=1/NO_START=0/g' /etc/default/dropbear
sed -i 's/DROPBEAR_PORT=22/DROPBEAR_PORT=143/g' /etc/default/dropbear
sed -i 's/DROPBEAR_EXTRA_ARGS=/DROPBEAR_EXTRA_ARGS="-p 109"/g' /etc/default/dropbear
echo "/bin/false" >> /etc/shells
echo "/usr/sbin/nologin" >> /etc/shells
/etc/init.d/dropbear restart

# install squid
cd
apt -y install squid3
wget -O /etc/squid/squid.conf "https://raw.githubusercontent.com/apih46/ba/main/squid3.conf"
sed -i $MYIP2 /etc/squid/squid.conf

# setting vnstat
apt -y install vnstat
/etc/init.d/vnstat restart
apt -y install libsqlite3-dev
wget https://humdi.net/vnstat/vnstat-2.6.tar.gz
tar zxvf vnstat-2.6.tar.gz
cd vnstat-2.6
./configure --prefix=/usr --sysconfdir=/etc && make && make install
cd
vnstat -u -i $NET
sed -i 's/Interface "'""eth0""'"/Interface "'""$NET""'"/g' /etc/vnstat.conf
chown vnstat:vnstat /var/lib/vnstat -R
systemctl enable vnstat
/etc/init.d/vnstat restart
rm -f /root/vnstat-2.6.tar.gz
rm -rf /root/vnstat-2.6

# install stunnel
apt install stunnel4 -y
cat > /etc/stunnel/stunnel.conf <<-END
cert = /etc/stunnel/stunnel.pem
client = no
socket = a:SO_REUSEADDR=1
socket = l:TCP_NODELAY=1
socket = r:TCP_NODELAY=1

[dropbear]
accept = 789
connect = 127.0.0.1:109

[dropbear]
accept = 777
connect = 127.0.0.1:22

[openvpn]
accept = 442
connect = 127.0.0.1:1194

END

# make a certificate
openssl genrsa -out key.pem 2048
openssl req -new -x509 -key key.pem -out cert.pem -days 1095 \
-subj "/C=$country/ST=$state/L=$locality/O=$organization/OU=$organizationalunit/CN=$commonname/emailAddress=$email"
cat key.pem cert.pem >> /etc/stunnel/stunnel.pem

# konfigurasi stunnel
sed -i 's/ENABLED=0/ENABLED=1/g' /etc/default/stunnel4
/etc/init.d/stunnel4 restart

#OpenVPN
wget https://raw.githubusercontent.com/apih46/ba/main/vpn.sh &&  chmod +x vpn.sh && ./vpn.sh

# install fail2ban
apt -y install fail2ban

# Instal DDOS Flate
if [ -d '/usr/local/ddos' ]; then
	echo; echo; echo "Please un-install the previous version first"
	exit 0
else
	mkdir /usr/local/ddos
fi
clear
echo; echo 'Installing DOS-Deflate 0.6'; echo
echo; echo -n 'Downloading source files...'
wget -q -O /usr/local/ddos/ddos.conf http://www.inetbase.com/scripts/ddos/ddos.conf
echo -n '.'
wget -q -O /usr/local/ddos/LICENSE http://www.inetbase.com/scripts/ddos/LICENSE
echo -n '.'
wget -q -O /usr/local/ddos/ignore.ip.list http://www.inetbase.com/scripts/ddos/ignore.ip.list
echo -n '.'
wget -q -O /usr/local/ddos/ddos.sh http://www.inetbase.com/scripts/ddos/ddos.sh
chmod 0755 /usr/local/ddos/ddos.sh
cp -s /usr/local/ddos/ddos.sh /usr/local/sbin/ddos
echo '...done'
echo; echo -n 'Creating cron to run script every minute.....(Default setting)'
/usr/local/ddos/ddos.sh --cron > /dev/null 2>&1
echo '.....done'
echo; echo 'Installation has completed.'
echo 'Config file is at /usr/local/ddos/ddos.conf'
echo 'Please send in your comments and/or suggestions to zaf@vsnl.com'

# banner /etc/issue.net
echo "Banner /etc/issue.net" >>/etc/ssh/sshd_config
sed -i 's@DROPBEAR_BANNER=""@DROPBEAR_BANNER="/etc/issue.net"@g' /etc/default/dropbear

# blockir torrent
iptables -A FORWARD -m string --string "get_peers" --algo bm -j DROP
iptables -A FORWARD -m string --string "announce_peer" --algo bm -j DROP
iptables -A FORWARD -m string --string "find_node" --algo bm -j DROP
iptables -A FORWARD -m string --algo bm --string "BitTorrent" -j DROP
iptables -A FORWARD -m string --algo bm --string "BitTorrent protocol" -j DROP
iptables -A FORWARD -m string --algo bm --string "peer_id=" -j DROP
iptables -A FORWARD -m string --algo bm --string ".torrent" -j DROP
iptables -A FORWARD -m string --algo bm --string "announce.php?passkey=" -j DROP
iptables -A FORWARD -m string --algo bm --string "torrent" -j DROP
iptables -A FORWARD -m string --algo bm --string "announce" -j DROP
iptables -A FORWARD -m string --algo bm --string "info_hash" -j DROP
iptables-save > /etc/iptables.up.rules
iptables-restore -t < /etc/iptables.up.rules
netfilter-persistent save
netfilter-persistent reload

# download script
cd /usr/bin
wget -O add-host "https://raw.githubusercontent.com/apih46/ba/main/add-host.sh"
wget -O add-host "https://raw.githubusercontent.com/apih46/ba/main/add-host.sh"
wget -O about "https://raw.githubusercontent.com/apih46/ba/main/about.sh"
wget -O menu "https://raw.githubusercontent.com/apih46/ba/main/menu.sh"
wget -O menu "https://raw.githubusercontent.com/apih46/ba/main/update.sh"
wget -O usernew "https://raw.githubusercontent.com/apih46/ba/main/usernew.sh"
wget -O trial "https://raw.githubusercontent.com/apih46/ba/main/trial.sh"
wget -O hapus "https://raw.githubusercontent.com/apih46/ba/main/hapus.sh"
wget -O member "https://raw.githubusercontent.com/apih46/ba/main/member.sh"
wget -O delete "https://raw.githubusercontent.com/apih46/ba/main/delete.sh"
wget -O cek "https://raw.githubusercontent.com/apih46/ba/main/cek.sh"
wget -O restart "https://raw.githubusercontent.com/apih46/ba/main/restart.sh"
wget -O speedtest-cli "https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py"
wget -O info "https://raw.githubusercontent.com/apih46/ba/main/info.sh"
wget -O ram "https://raw.githubusercontent.com/apih46/ba/main/ram.sh"
wget -O renew "https://raw.githubusercontent.com/apih46/ba/main/renew.sh"
wget -O autokill "https://raw.githubusercontent.com/apih46/ba/main/autokill.sh"
wget -O ceklim "https://raw.githubusercontent.com/apih46/ba/main/ceklim.sh"
wget -O tendang "https://raw.githubusercontent.com/apih46/ba/main/tendang.sh"
wget -O change-port "https://raw.githubusercontent.com/apih46/ba/main/change.sh"
wget -O port-ovpn "https://raw.githubusercontent.com/apih46/ba/main/port-ovpn.sh"
wget -O port-ssl "https://raw.githubusercontent.com/apih46/ba/main/port-ssl.sh"
wget -O port-wg "https://raw.githubusercontent.com/apih46/ba/main/port-wg.sh"
wget -O port-tr "https://raw.githubusercontent.com/apih46/ba/main/port-tr.sh"
wget -O port-sstp "https://raw.githubusercontent.com/apih46/ba/main/port-sstp.sh"
wget -O port-squid "https://raw.githubusercontent.com/apih46/ba/main/port-squid.sh"
wget -O port-ws "https://raw.githubusercontent.com/apih46/ba/main/port-ws.sh"
wget -O port-vless "https://raw.githubusercontent.com/apih46/ba/main/port-vless.sh"
wget -O port-xray "https://raw.githubusercontent.com/apih46/ba/main/port-xray.sh"
wget -O port-wspc "https://raw.githubusercontent.com/apih46/ba/main/port-wspc.sh"
wget -O port-trpc "https://raw.githubusercontent.com/apih46/ba/main/port-trpc.sh"
wget -O port-vlpc "https://raw.githubusercontent.com/apih46/ba/main/port-vlpc.sh"
wget -O wbmn "https://raw.githubusercontent.com/apih46/ba/main/webmin.sh"
wget -O xp "https://raw.githubusercontent.com/apih46/ba/main/xp.sh"
wget -O menu-vmess "https://raw.githubusercontent.com/apih46/ba/main/menu-vmess.sh"
wget -O menu-vmpc "https://raw.githubusercontent.com/apih46/ba/main/menu-vmpc.sh"
wget -O menu-vless "https://raw.githubusercontent.com/apih46/ba/main/menu-vless.sh"
wget -O menu-vlpc "https://raw.githubusercontent.com/apih46/ba/main/menu-vlpc.sh"
wget -O menu-l2tp "https://raw.githubusercontent.com/apih46/ba/main/menu-l2tp.sh"
wget -O menu-pptp "https://raw.githubusercontent.com/apih46/ba/main/menu-pptp.sh"
wget -O menu-sstp "https://raw.githubusercontent.com/apih46/ba/main/menu-sstp.sh"
wget -O menu-ss "https://raw.githubusercontent.com/apih46/ba/main/menu-ss.sh"
wget -O menu-ssr "https://raw.githubusercontent.com/apih46/ba/main/menu-ssr.sh"
wget -O menu-trojan "https://raw.githubusercontent.com/apih46/ba/main/menu-trojan.sh"
wget -O menu-trpc "https://raw.githubusercontent.com/apih46/ba/main/menu-trpc.sh"
wget -O menu-wg "https://raw.githubusercontent.com/apih46/ba/main/menu-wg.sh"
wget -O menu-ssh "https://raw.githubusercontent.com/apih46/ba/main/menu-ssh.sh"
wget -O menu-xray "https://raw.githubusercontent.com/apih46/ba/main/menu-xray.sh"
chmod +x add-host
chmod +x menu
chmod +x update
chmod +x usernew
chmod +x trial
chmod +x hapus
chmod +x member
chmod +x delete
chmod +x cek
chmod +x restart
chmod +x speedtest-cli
chmod +x info
chmod +x about
chmod +x autokill
chmod +x tendang
chmod +x ceklim
chmod +x ram
chmod +x renew
chmod +x change-port
chmod +x port-ovpn
chmod +x port-ssl
chmod +x port-wg
chmod +x port-sstp
chmod +x port-tr
chmod +x port-squid
chmod +x port-ws
chmod +x port-vless
chmod +x port-xray
chmod +x port-wspc
chmod +x port-vlpc
chmod +x port-trpc
chmod +x wbmn
chmod +x xp
chmod +x menu-vmess
chmod +x menu-vmpc
chmod +x menu-vless
chmod +x menu-vlpc
chmod +x menu-l2tp
chmod +x menu-pptp
chmod +x menu-sstp
chmod +x menu-ss
chmod +x menu-ssr
chmod +x menu-trojan
chmod +x menu-trpc
chmod +x menu-wg
chmod +x menu-ssh
chmod +x menu-xray
echo "0 5 * * * root reboot" >> /etc/crontab
echo "0 0 * * * root xp" >> /etc/crontab
# remove unnecessary files
cd
apt autoclean -y
apt -y remove --purge unscd
apt-get -y --purge remove samba*;
apt-get -y --purge remove apache2*;
apt-get -y --purge remove bind9*;
apt-get -y remove sendmail*
apt autoremove -y
# finishing
cd
chown -R www-data:www-data /home/vps/public_html
/etc/init.d/nginx restart
/etc/init.d/openvpn restart
/etc/init.d/cron restart
/etc/init.d/ssh restart
/etc/init.d/dropbear restart
/etc/init.d/fail2ban restart
/etc/init.d/stunnel4 restart
/etc/init.d/vnstat restart
/etc/init.d/squid restart
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7100 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7200 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7400 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7500 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7600 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7700 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7800 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7900 --max-clients 500
history -c
echo "unset HISTFILE" >> /etc/profile

cd
rm -f /root/key.pem
rm -f /root/cert.pem
rm -f /root/ssh-vpn.sh

# finihsing
clear
