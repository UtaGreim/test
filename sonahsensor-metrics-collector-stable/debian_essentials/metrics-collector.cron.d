MAILTO=""
#
# Regular cron jobs for the metrics-collector package
#
*/10 * * * *	root	touch /var/log/mccronruns.txt && sudo /usr/sbin/collectmetrics
00 18 * * *	root	touch /var/log/mccronruns.txt &&  sudo /usr/sbin/collectmetrics_external
