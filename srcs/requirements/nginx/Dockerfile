FROM debian:11

RUN apt-get update

RUN apt-get install -y nginx

COPY tools/nginx.crt /etc/nginx/ssl/nginx.crt
COPY tools/nginx.key /etc/nginx/ssl/nginx.key

COPY conf/nginx.conf /etc/nginx/nginx.conf

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]

