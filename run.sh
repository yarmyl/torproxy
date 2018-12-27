#!/bin/bash

./iptables_rules.sh
STATE=$(docker ps -a | grep tor | awk '{print $12, $13, $14, $15}' | sed '{s/ *$//g}' | grep "tor")
if [ "$STATE" == "" ]
then
    docker run --name tor --net host -d tor
else
    docker start tor
fi
if [ "$1" == "fill" ]
then
    while true
    do
        ipset flush black_list
        ./fill_ipset.sh
        sleep 600
    done
fi
