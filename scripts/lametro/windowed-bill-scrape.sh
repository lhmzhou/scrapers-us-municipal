#/bin/sh
set -e

exec 2>&1

cd $APPDIR
$PUPADIR update --datadir=/cache/bills/_data/ lametro --scrape bills window=$WINDOW
$PUPADIR update --datadir=/cache/bills/_data/ lametro --import
SHARED_DB=True DATABASE_URL=postgis://datamade@lametro-upgrade.datamade.us/lametro_staging pupa update --datadir=/cache/bills/_data/ lametro --import