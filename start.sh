#!/bin/bash

function longsleep() {
    while : ; do
        echo "Idling..."
        sleep 60
    done
}

if [ -z ${MONERO_ADDRESS} ]; then
    echo "No MONERO_ADDRESS provided..."
    longsleep
else
    echo "MONERO_ADDRESS: ${MONERO_ADDRESS}"
fi
if [ -z ${POOL_URL} ]; then
    echo "No POOL_URL provided (server:port)..."
    longsleep
else
    echo "POOL_URL: ${POOL_URL}"
fi
if [ -z ${EMAIL} ]; then
    echo "No EMAIL provided..."
    longsleep
else
    echo "EMAIL: ${EMAIL}"
fi

devicename=$(hostname)
echo "WORKER: ${devicename}"

minerd \
   -a cryptonight \
   -o "stratum+tcp://${POOL_URL}" \
   -u "${MONERO_ADDRESS}" \
   -p "${devicename}:${EMAIL}" \
   -t "${THREAD-4}"
