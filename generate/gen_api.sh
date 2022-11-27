#!/bin/bash

CURDIR=$(cd $(dirname $0); pwd)
DATADIR=${CURDIR}/../api/$1
SCRIPT=${CURDIR}/gen_go.sh
DATA_SCRIPT=${CURDIR}/gen_data.sh

$SCRIPT -f "$DATADIR/*.proto"
# $DATA_SCRIPT