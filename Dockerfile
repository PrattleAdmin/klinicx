FROM php:7.4-apache
# Install Dependencies
RUN docker-php-ext-install pdo_mysql
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
EXPOSE 80
# Start Apache with the CMD
CMD ["apache2-foreground"]