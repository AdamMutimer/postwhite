#!/bin/bash
echo "Postwhite - First Run"
echo "This will take some time..."
bash scrape_yahoo
bash scrape_zuora
bash scrape_ovh
bash scrape_proofpoint
bash postwhite
echo ""
echo "Scrapes and Whitelist Completed!"
echo ""
echo "Installing CronJobs!"

bash_local=$(which bash)
crontab=$(which crontab)
$crontab -l > /tmp/$USER-cron.tmp

echo "" >> /tmp/$USER-cron.tmp
echo "#Postwhite Tasks" >> /tmp/$USER-cron.tmp
echo "0 6 * * * $bash_local $PWD/postwhite >/dev/null 2>&1" >> /tmp/$USER-cron.tmp
echo "0 0 1 * * $bash_local $PWD/scrape_yahoo >/dev/null 2>&1" >> /tmp/$USER-cron.tmp
echo "0 0 1 * * $bash_local $PWD/scrape_zuora >/dev/null 2>&1" >> /tmp/$USER-cron.tmp
echo "0 0 1 * * $bash_local $PWD/scrape_ovh >/dev/null 2>&1" >> /tmp/$USER-cron.tmp
echo "0 0 1 * * $bash_local $PWD/scrape_proofpoint >/dev/null 2>&1" >> /tmp/$USER-cron.tmp

$crontab /tmp/$USER-cron.tmp

echo "Postwhite - First Run Completed"
