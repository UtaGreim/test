#!/bin/sh

#Update temperature value
./update_temp.sh
temp=`cat /var/www/html/img-host/temperature`
temptxt="pi_temperature $temp"

#Update Voltage
./update_volt.sh
volt=`cat /var/www/html/img-host/voltage`
volttxt="pi_voltage $volt"

#Update Clock
./update_clock.sh
clock=`cat /var/www/html/img-host/clock`
clocktxt="pi_frequency $clock"

#Update Data Volume
#./update_volume.sh    #This is updated in a seperate cron job
volume=`cat /var/www/html/img-host/volume`
volumetxt="pi_used_data_volume $volume"

#Update Ping
./update_ping.sh
pingtime=`cat /var/www/html/img-host/ping`
pingtimetxt="pi_ping_vpn1 $pingtime"

#Update Free space
./update_free_space.sh
free_space=`cat /var/www/html/img-host/free_space`
free_spacetxt="pi_free_space $free_space"

#Update Free ram
./update_used_RAM.sh
ram=`cat /var/www/html/img-host/ram`
ramtxt="pi_ram $ram"

#Update Free space
./update_used_CPU.sh
cpu=`cat /var/www/html/img-host/cpu`
cputxt="pi_cpu $cpu"

#Update pk              #This is not queried by prometheus
./update_pk.sh

#Update public ip
./update_public_ip.sh

#Empty metrics file and insert new values
truncate -s 0 /var/www/html/img-host/metrics
echo $temptxt >> /var/www/html/img-host/metrics
echo $volumetxt >> /var/www/html/img-host/metrics
echo $pingtimetxt >> /var/www/html/img-host/metrics
#echo $volttxt >> /var/www/html/img-host/metrics
#echo $clocktxt >> /var/www/html/img-host/metrics
echo $free_spacetxt >> /var/www/html/img-host/metrics
echo $cputxt >> /var/www/html/img-host/metrics
echo $ramtxt >> /var/www/html/img-host/metrics

cat /var/www/html/img-host/metrics
