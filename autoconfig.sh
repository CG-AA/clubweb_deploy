#!/bin/bash

cp /etc/letsencrypt/live/hspc4.ddns.net/fullchain.pem .
cp /etc/letsencrypt/live/hspc4.ddns.net/privkey.pem .

docker build -t clubweb .
docker run -d -p 80:80 -p 443:443 --name clubweb --restart=always -v /etc/letsencrypt:/etc/letsencrypt clubweb
