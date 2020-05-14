#!/bin/sh

IP=`dig +short myip.opendns.com @resolver1.opendns.com`

echo url="https://api.dynu.com/nic/update?hostname=${DYNU_DDNS_DOMAIN}&myip=$IP&username=${DYNU_USERNAME}&password=${DYNU_PASSWORD}" | curl -k -o /var/log/dynujob.log -K - 