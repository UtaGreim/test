import logging
import graypy
import time
import subprocess

# instantiating a new logger object to send the log message
logger = logging.getLogger('logger')
# setting the importance of the message
logger.setLevel(logging.INFO)

# instantiating a new handler with GELF format (specialised JSON) based on address and port
handler = graypy.GELFHandler('uta.dyndns.sonah.xyz', 12201)
# adding the handler to the logger
logger.addHandler(handler)

while 1:
    # run script for collecting metrics
    subprocess.call("/etc/metrics-collector/update_metrics.sh")
    # modifing the message: assigning new fields and their values (reading from files filled by shell script)
    adapter = logging.LoggerAdapter(logger,
                                       {'temperature': float(open('/var/www/html/img-host/temperature', 'r').read().strip()),
                                        'ping': float(open('/var/www/html/img-host/ping', 'r').read().strip()),
                                        'clock': float(open('/var/www/html/img-host/clock', 'r').read().strip()),
                                        'pub_ip': open('/var/www/html/img-host/pub_ip', 'r').read().strip(),
                                        'pk': float(open('/var/www/html/img-host/pk', 'r').read().strip()),
                                        'voltage': float(open('/var/www/html/img-host/voltage', 'r').read().strip()),
                                        'volume': float(open('/var/www/html/img-host/volume', 'r').read().strip()),
                                        'free_space': float(open('/var/www/html/img-host/free_space', 'r').read().strip()),
                                        'ram': float(open('/var/www/html/img-host/ram', 'r').read().strip()),
                                        'cpu': float(open('/var/www/html/img-host/cpu', 'r').read().strip())
                                        })
    # sending message
    adapter.debug("new metrics")
    #time waiting in seconds before next iteration
    time.sleep(60)
