#!/bin/bash

#################################
## Begin of user-editable part ##
#################################

POOL=stratum+tcp://eth-us.f2pool.com:6688
WALLET=0xbfaa13e64c7ee3874f68295bd4d49ce58997bd25.lol123
#################################
##  End of user-editable part  ##
#################################

cd "$(dirname "$0")"

chmod +x ./lolMiner && ./lolMiner --algo ETHASH --pool $POOL --user $WALLET $@
while [ $? -eq 42 ]; do
    sleep 10s
    ./lolMiner --algo ETHASH --pool $POOL --user $WALLET $@
done
