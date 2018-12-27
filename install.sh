#!/bin/bash

apt-get update && apt-get install ipset
docker build -t tor .
echo "[Unit]
Description=TorProxy Application Service
Requires=networking.service
Requires=docker.service
After=networking.service

[Service]
Type=simple
WorkingDirectory=`pwd`
ExecStart=/bin/bash run.sh fill
PIDFile=/run/torproxy.pid
Restart=always

[Install]
WantedBy=multi-user.target" > /etc/systemd/system/torproxy.service

systemctl enable torproxy
systemctl start torproxy
