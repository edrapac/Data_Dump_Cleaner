#!/bin/bash
currentIP=`curl 'ipinfo.io' | jq -r '.ip'`
entry=`curl 'ipinfo.io' | jq -r '.ip' | awk '{print $0"\txxx.test.com"}'`
if grep -E -q '[[:digit:]]+\.[[:digit:]]+\.[[:digit:]]+\.[[:digit:]]+[[:space:]]+xxx\.test\.com' /etc/hosts; #check if the entry exists
then # if it does, update it and also create backup
        sed -i'.bak' "s/[[:digit:]]*\.[[:digit:]]*\.[[:digit:]]*\.[[:digit:]]*[[:space:]]*xxx\.test\.com/$currentIP    xxx.test.com/g" /etc/hosts
else
        echo "$entry" >> /etc/hosts # add it if it doesnt exist
fi