#!/bin/sh

echo "Building Whitelist..."

echo " > Scraping OVH"
bash /usr/src/postwhite/scrape_ovh

echo " > Scraping ProofPoint"
bash /usr/src/postwhite/scrape_proofpoint

echo " > Scraping Yahoo/Aol"
bash /usr/src/postwhite/scrape_yahoo

echo " > Scraping Zuora"
bash /usr/src/postwhite/scrape_zuora

echo " > Running Postwhite..."
bash /usr/src/postwhite/postwhite

echo " >> Whitelist Generated!"

