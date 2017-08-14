#!/bin/bash
echo $[100-$(vmstat 1 2|tail -1|awk '{print $15}')] | sudo tee /var/www/html/img-host/cpu
