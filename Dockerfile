FROM nginx:stable-alpine3.17-slim

RUN apk add certbot certbot-nginx
RUN crontab -l | { cat; echo "0 12 * * * /usr/bin/certbot renew --quiet"; } | crontab -

COPY nginx/conf.d/ /etc/nginx/conf.d/

