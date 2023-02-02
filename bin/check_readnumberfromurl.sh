#!/bin/bash

#
# Na dane adrese precte cislo a to nasledne vyhodnoti
#

URL=$1
WARN=$2
CRIT=$3

POCET=`wget --user-agent="Mozilla" --no-check-certificate -O - $URL`
if [ $? -ne 0 ]; then
    echo "Nepodarilo se stahnout hodnotu z $URL"
    exit 3
fi

if [ ${#POCET} -lt 1 ]; then
    echo "Nepodarilo se stahnout hodnotu z $URL - prazdna hodnota"
    exit 3
elif [ ${#POCET} -gt 6 ]; then
    echo "Nepodarilo se stahnout hodnotu z $URL - vracena hodnota neni cislo"
    exit 3
fi

echo "Pocet: ${POCET}"

if [ $POCET -ge $CRIT ]         # critical
then
    exit 2
elif [ $POCET -ge $WARN ]       # warn
then
    exit 1
else                            # ok
    exit 0
fi
