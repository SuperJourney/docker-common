#!/bin/bash 

sed -i "s|127.0.0.1|${LOG_HTTP_IP}|g" /usr/bin/phdaemon
sed -i "s|11011|${LOG_HTTP_PORT}|g" /usr/bin/phdaemon


phddns start 

sleep 2

phddns status > ~/status.log

tail -f  ~/status.log
N