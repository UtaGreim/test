vcgencmd measure_temp  | sed "s/.*temp=\(.*\)'C.*/\1/" | sudo tee /var/www/html/img-host/temperature
