FROM nginx:alpine

# Copy the static website files, SSL certificate and key to the Nginx directories
COPY ./website /usr/share/nginx/html
COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./fullchain.pem /etc/ssl/certs/certificate.crt
COPY ./privkey.pem /etc/ssl/certs/private.key