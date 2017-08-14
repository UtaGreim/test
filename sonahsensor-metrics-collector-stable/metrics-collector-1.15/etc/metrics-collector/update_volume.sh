#! /bin/bash
PERC=$(curl --user-agent 'Mozilla/4.0' http://pass.telekom.de/api/service/generic/v1/status | jq .usedPercentage)
echo ${#PERC}
if [ ${#PERC} -gt 5 ] || [ -z "$PERC" ];
        then
                echo "error"
                echo "error $PERC" | sudo tee /var/www/html/img-host/volume-error
                echo "-1" | sudo tee /var/www/html/img-host/volume
        else
                echo "success"
                echo "$PERC" | sudo tee /var/www/html/img-host/volume
fi

