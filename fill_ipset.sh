#!/bin/bash

docker exec tor cat /home/black_nets/black_nets.list | sed 's/^/add black_list /g' > rules.list
ipset restore < rules.list
