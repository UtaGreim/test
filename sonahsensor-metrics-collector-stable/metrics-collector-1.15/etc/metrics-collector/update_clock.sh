vcgencmd measure_clock arm  | sed "s/.*=\(.*\)/\1/" | sudo tee /var/www/html/img-host/clock
