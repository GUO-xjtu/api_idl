#!/bin/bash

set -e

CURDIR=$(cd $(dirname $0); pwd)
sysname=$(uname -s)
if [[ ${sysname} == "Darwin" ]]
then
    protoc=${CURDIR}/bin/osx/protoc
    protoc_gen_go=${CURDIR}/bin/osx/protoc-gen-go
else
    protoc=${CURDIR}/bin/linux/protoc
    protoc_gen_go=${CURDIR}/bin/linux/protoc-gen-go
fi

OUT_DIR=$GOPATH/src

$protoc --version

echo "start generate .go file..."

while getopts 'f:v' flag; do
    case "${flag}" in
	f) pb_file=${OPTARG}
	   echo $pb_file
	   $protoc \
	       --plugin=$protoc_gen_go \
	       --proto_path=$CURDIR/..  \
	       --go_out=$OUT_DIR \
	       $pb_file
	   ;;
    esac
done
