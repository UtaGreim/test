#!/bin/bash
echo $[$(df | awk '{ print $4}' | sort -rn | head -n 1) / 1024] | sudo tee /var/www/html/img-host/free_space
