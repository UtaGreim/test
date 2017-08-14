cat /home/pi/Gitprojects/sonah_mothership/sensor.info | sed "s/.*pk\x22:\([0-9]*\),.*/\1/" | sudo tee /var/www/html/img-host/pk
