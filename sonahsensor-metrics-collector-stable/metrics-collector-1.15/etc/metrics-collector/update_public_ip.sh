#!/bin/bash
IP=$(curl http://checkip.amazonaws.com)
echo "$IP" |  sudo tee /var/www/html/img-host/pub_ip
