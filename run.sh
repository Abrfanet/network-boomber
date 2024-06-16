#!/bin/bash


if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

 bash ./pingo.sh & bash ./rdp.sh & bash ./curl.sh