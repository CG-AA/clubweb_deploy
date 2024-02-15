#!/bin/bash

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

sudo cp /etc/letsencrypt/live/hspc4.ddns.net/fullchain.pem .
sudo cp /etc/letsencrypt/live/hspc4.ddns.net/privkey.pem .

sudo docker build -t ClubWeb .
sudo docker run -d -p 80:80 -p 443:443 --name ClubWeb --restart=always -v /etc/letsencrypt:/etc/letsencrypt ClubWeb