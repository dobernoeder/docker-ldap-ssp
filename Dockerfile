FROM php:7.4-apache

MAINTAINER zsx <thinkernel@gmail.com>

ENV SSP_VERSION 1.3
ENV SSP_PACKAGE ltb-project-self-service-password

# Install the software that ssp environment requires
RUN apt-get update \
    && apt-get install -y libmcrypt-dev libldap2-dev --no-install-recommends

RUN pecl install mcrypt-1.0.3 && docker-php-ext-enable mcrypt

#RUN docker-php-ext-configure ldap --with-libdir=lib/$(lscpu | head -n1 | awk '{print $2}')-linux-gnu/

#RUN docker-php-ext-install ldap \
#    && rm -rf /var/lib/apt/lists/*

# Install ssp
#RUN curl -L https://ltb-project.org/archives/${SSP_PACKAGE}-${SSP_VERSION}.tar.gz \
#    -o ssp.tar.gz && tar xf ssp.tar.gz -C /var/www/html && rm -f ssp.tar.gz \
#    && mv /var/www/html/${SSP_PACKAGE}-${SSP_VERSION}/* /var/www/html/ && rm -rf /var/www/html/${SSP_PACKAGE}-${SSP_VERSION}

#RUN chown -R www-data:www-data /var/www/html/

#EXPOSE 80
