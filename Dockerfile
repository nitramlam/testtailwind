# Utiliser une image PHP avec Apache
FROM php:8.0-apache

# Installer les extensions PHP nécessaires
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Activer mod_rewrite pour Apache
RUN a2enmod rewrite

# Installer Node.js et npm
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash - \
    && apt-get update && apt-get install -y nodejs

# Installer Tailwind CSS en utilisant npm
RUN npm install -g tailwindcss

# Copier le code source dans le conteneur
COPY . /var/www/html/

# Configurer le répertoire public comme racine d'Apache
WORKDIR /var/www/html/