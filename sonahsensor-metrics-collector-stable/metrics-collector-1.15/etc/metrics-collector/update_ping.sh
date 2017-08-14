#!/bin/bash
ping -c 1 vpn1.sonah.xyz | tail -1| awk -F '/' '{print $5}' | sudo tee /var/www/html/img-host/ping
