FROM php:7.4-apache
# Install Dependencies
RUN docker-php-ext-install pdo_mysql
RUN apt-get update && \
    apt-get install -y
RUN apt-get install -y curl
RUN apt-get install -y build-essential libssl-dev zlib1g-dev libpng-dev libjpeg-dev libfreetype6-dev
RUN apt-get install -y libicu-dev
RUN apt-get update
RUN docker-php-ext-install intl
RUN docker-php-ext-configure intl
RUN docker-php-ext-install mysqli pdo pdo_mysql zip mbstring
RUN a2enmod rewrite
RUN service apache2 restart
# RUN composer require some-codeigniter-plugin
# Copy Application files
COPY . /var/www/html
# Set environment variables for the MySQL Connection
ENV MYSQL_HOST=klinicx-db.mysql.database.azure.com \
    MYSQL_DATABASE=klinicx_db \
    MYSQL_USER=klinicx_superadmin \
    MYSQL_PASSWORD=&SkaCpdGK6M,3sqJ
#Expose Port for serviing site
EXPOSE 443
# EXPOSE 80
# Start Apache with the CMD
CMD ["apache2-foreground"]