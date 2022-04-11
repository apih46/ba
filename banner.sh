#!/bin/bash

IPVPS=$(curl -s ipinfo.io/ip )
vip=$(curl -sS https://raw.githubusercontent.com/apih46/ip/main/list | grep $IPVPS | awk '{print $5}')

if [[ ${vip} == 'true' ]]; then
read -p "CHANGE BANNER NAME : " banner

echo "$banner" >/root/.ctech/name

menu
else
menu
fi