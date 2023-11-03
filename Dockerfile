FROM php:8.1-fpm

RUN apt update
# Instruction pour installer l'extension mysql
RUN docker-php-ext-install mysqli

# Instruction pour installer composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" 
RUN php -r "if (hash_file('sha384', 'composer-setup.php') === 'e21205b207c3ff031906575712edab6f13eb0b361f2085f1f1237b7126d785e826a450292b6cfd1d64d92e6563bbde02') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
RUN php composer-setup.php 
RUN php -r "unlink('composer-setup.php');"
RUN mv composer.phar /usr/local/bin/composer

# Instruction pour installer git et l'extention zip pour PHP
RUN apt-get -y install git
RUN apt-get  install -y \
    zlib1g-dev \
    libzip-dev
RUN docker-php-ext-install zip

# Expose port 9000 pour que PHP FPM puisse écoutait le port 9000
EXPOSE 9000

# Installer WP-CLI
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    php wp-cli.phar --info && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp
