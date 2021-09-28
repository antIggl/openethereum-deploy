#!/bin/bash
TMPFILE=`mktemp`
export PATH=$PATH:.
BASE_PATH=$(dirname $0)
#if [ ! $(type -P $PWD/ethkey) ];  then
#    ARCH=`uname -m`
#    ETHKEY_URL=`curl -sS "https://vanity-service.parity.io/parity-binaries?version=stable&format=markdown&os=linux&architecture=$ARCH" | grep ethkey | awk {'print $5'}  | cut -d"(" -f2 | cut -d")" -f1`
#    wget -q $ETHKEY_URL
#    chmod +x ethkey
#fi

#if [ ! $(type -P $PWD/ethstore) ];  then
#    ARCH=`uname -m`
#    ETHSTORE_URL=`curl -sS "https://vanity-service.parity.io/parity-binaries?version=stable&format=markdown&os=linux&architecture=$ARCH" | grep ethstore | awk {'print $5'}  | cut -d"(" -f2 | cut -d")" -f1`
#    wget -q $ETHSTORE_URL
#    chmod +x ethstore
#fi


# Generate the private and public keys
$BASE_PATH/ethereum-generate-wallet/ethereum-wallet-generator.sh > $TMPFILE

cat $TMPFILE | grep Public | awk {'print $3'} > $1/key.pub
cat $TMPFILE | grep Private | awk {'print $3'} > $1/key.priv
cat $TMPFILE | grep Address | awk {'print $2'} > $1/address.txt

rm -rf $TMPFILE

