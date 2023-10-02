FROM debian:11

RUN apt-get update && apt-get install -y php-fpm php-mysql curl wget

RUN service php7.4-fpm start
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
 
RUN sed -i 's/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/g' /etc/php/7.4/fpm/php.ini

RUN mkdir -p /var/www/html
WORKDIR /var/www/html

RUN wget https://wordpress.org/latest.tar.gz 
RUN tar -xzvf latest.tar.gz 
RUN rm latest.tar.gz
RUN mv wordpress/* .

RUN chmod -R 777 .

COPY ./script.sh .

RUN chmod +x script.sh

EXPOSE 9000

CMD ["./script.sh"]