# PHP 7.3 sürümünü baz alan resmi PHP Apache görüntüsünü kullanıyoruz
FROM php:7.3.33-apache

# Apache mod_rewrite modülünü etkinleştiriyoruz (URL yeniden yazımı için gereklidir)
RUN a2enmod rewrite

# PHP eklenti gereksinimlerini kuruyoruz (örneğin: mysqli, pdo_mysql gibi)
RUN docker-php-ext-install mysqli pdo_mysql

# Çalışma dizinini /var/www/html/caiwl altına ayarlıyoruz
WORKDIR /var/www/html/caiwl

# Lokal projenizin dosyalarını Docker görüntüsüne kopyalıyoruz
COPY . .

# Docker konteynerı açıldığında Apache'yi başlatıyoruz
CMD ["apache2-foreground"]
