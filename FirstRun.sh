#!/bin/bash
echo "Postwhite - First Run"
bash scrape_yahoo
bash scrape_zuora
bash scrape_ovh
bash postwhite
echo "Postwhite - First Run Completed"
