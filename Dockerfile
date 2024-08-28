FROM lephare/php:8.3

WORKDIR /var/www/adminer

VOLUME /var/www/adminer/plugins

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN curl -s https://api.github.com/repos/adminerevo/adminerevo/releases/latest | grep -wo "https://.*adminer-.*\.php" | xargs curl -o /var/www/adminer/adminer.php -L && \
    curl -o /var/www/adminer/plugin.php -L https://raw.githubusercontent.com/adminerevo/adminerevo/main/plugins/plugin.php

COPY --link ./index.php /var/www/adminer/
