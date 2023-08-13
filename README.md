## 1. Set Up NGINX
certbot can automatically configure NGINX for SSL/TLS. It looks for and modifies the server block in your NGINX configuration that contains a server_name directive with the domain name you’re requesting a certificate for. In our example, the domain is www.example.com.

Assuming you’re starting with a fresh NGINX install, use a text editor to create a file in the nginx/conf.d directory named domain‑name.conf (so in our example, www.example.com.conf).

Specify your domain name (and variants, if any) with the server_name directive:

```
server {
    listen 80 default_server;
    listen [::]:80 default_server;
    root /var/www/html;
    server_name example.com www.example.com;
}
```

But for example for pocketbase:

```
server {
    server_name          example.com www.example.com;
    client_max_body_size 10M;

    location / {
        proxy_set_header   Connection '';
        proxy_http_version 1.1;
        proxy_read_timeout 360s;

        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;

        proxy_pass http://127.0.0.1:8090;
    }
}
```

Save the file, then run this command to verify the syntax of your configuration and restart NGINX:

```
certbot --nginx -d example.com -d www.example.com
```

## 2. That was it
