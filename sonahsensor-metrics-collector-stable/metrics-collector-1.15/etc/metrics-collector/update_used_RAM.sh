#!/bin/bash
echo $(free -m| grep  Mem | awk '{ print int($3/$2*100) }') | sudo tee /var/www/html/img-host/ram
