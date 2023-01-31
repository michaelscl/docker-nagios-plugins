#!/bin/bash

#
# Na dane adrese precte cislo a to nasledne vyhodnoti
#

URL=$1
WARN=$2
CRIT=$3

POCET=`wget -O - --no-check-certificate --quiet $URL`
if [ $? -ne 0 ]; then
    echo "Nepodarilo se stahnout hodnotu z $URL"
    exit 2
fi

echo "Pocet: $POCET"

if [ $POCET -gt $CRIT ]		# critical
then
    exit 2
elif [ $POCET -gt $WARN ]	# warn
then
    exit 1
else
    exit 0
fi

