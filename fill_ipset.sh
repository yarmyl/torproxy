#!/bin/bash

docker exec tor cat /home/black_nets/black_nets.list | xargs -n1 ipset add black_list
