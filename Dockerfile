# Render-ready container: Laravel 5.1 + Apache + MariaDB (with sample DB import) + Basic Auth
FROM php:7.1-apache

# System dependencies
RUN apt-get update && apt-get install -y     mariadb-server     supervisor     git     unzip     libpng-dev libonig-dev libzip-dev     && rm -rf /var/lib/apt/lists/*

# PHP extensions
RUN docker-php-ext-install pdo pdo_mysql mbstring gd zip

# Apache config: document root to /var/www/html/public and enable rewrite
RUN a2enmod rewrite
ENV APACHE_DOCUMENT_ROOT=/var/www/html/public
RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/000-default.conf     && sed -ri -e 's!<Directory /var/www/>!<Directory /var/www/html/public>!g' /etc/apache2/apache2.conf     && sed -ri -e 's!AllowOverride None!AllowOverride All!g' /etc/apache2/apache2.conf

# Composer
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

# App code
WORKDIR /var/www/html
COPY app/ /var/www/html/

# Deploy scripts & supervisor
COPY deploy/supervisord.conf /etc/supervisor/supervisord.conf
COPY deploy/entrypoint.sh /entrypoint.sh
COPY deploy/init_db.sh /init_db.sh
RUN chmod +x /entrypoint.sh /init_db.sh

# Prepare storage permissions
RUN mkdir -p storage bootstrap/cache     && chown -R www-data:www-data /var/www/html     && chmod -R 775 storage bootstrap/cache || true

# Install vendors
RUN composer install --no-interaction --prefer-dist --no-dev --optimize-autoloader || true

EXPOSE 8080
CMD ["/entrypoint.sh"]
