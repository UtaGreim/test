vcgencmd measure_volts  | sed "s/.*=\(.*\)V.*/\1/" | sudo tee /var/www/html/img-host/voltage
