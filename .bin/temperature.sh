#!/usr/bin/env sh
#
# This program retrives the temperature
# for a city from yr.no API
#

set -e
set -o pipefail

USAGE=$(cat <<EOM
usage: $(basename $0) place

Get forecast temperatur for a place

  place short form for a place
        (example /Norway/Oslo/Oslo/Oslo)

See yr.no or http://fil.nrk.no/yr/viktigestader/noreg.txt
for valid place values
EOM
)

URL="https://www.yr.no/place/$1/forecast.xml"
CITY="$(rev <<< $1 | cut -d '/' -f 1 | rev)"

curl --silent $URL \
 | grep '<temperature' \
 | head -n 1 \
 | sed "s/.* value=\"\(.*\)\".*/\1°C $CITY/" || echo "$USAGE"
