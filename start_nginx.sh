#! /bin/bash

docker run \
  --name pocketbase-proxy \
  -v /home/pocketbase/nginx/conf.d/:/etc/nginx/conf.d/ \
  -v /home/pocketbase/nginx/certs/:/etc/ssl/ \
  -p 80:80 -p 443:443 \
  --network host \
  -d nginx

docker logs -f pocketbase-proxy
