#!/bin/bash

./iptables_rules.sh
STATE=$(docker ps -a | grep tor | awk '{print $12, $13, $14, $15}' | sed '{s/ *$//g}' | grep "tor")
if [ "$STATE" == "" ]
then
    docker run --name tor --net host -d tor
else
    docker start tor
fi

while true
do
    if [ "$1" == "fill" ]
    then
        ipset flush black_list
        ./fill_ipset.sh
    fi
    sleep 600
done
