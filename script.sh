#!/bin/bash

service cron restart
tor -f /etc/tor/torrc
