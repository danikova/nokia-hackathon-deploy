#! /bin/bash

docker run \
  --name pocketbase-proxy \
  -v /home/pocketbase/nginx/conf.d/:/etc/nginx/conf.d/ \
  -v /home/pocketbase/nginx/certs/:/etc/letsencrypt/live/ \
  -p 80:80 -p 443:443 \
  --network host \
  -d \
  nginx-letsencrypt

docker logs -f pocketbase-proxy
