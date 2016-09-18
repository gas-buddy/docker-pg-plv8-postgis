FROM clkao/postgres-plv8:9.5-1.5

ENV POSTGRES_USER=docker
ENV POSTGRES_PASSWORD=postgis

ENV POSTGIS_MAJOR 2.2
ENV POSTGIS_VERSION 2.2.2+dfsg-4.pgdg80+1

RUN apt-get update && \
    apt-get install -y --no-install-recommends curl ca-certificates postgresql-9.5-postgis-$POSTGIS_MAJOR=$POSTGIS_VERSION POSTGIS=$POSTGIS_VERSION && \
    curl -sL https://deb.nodesource.com/setup_6.x | bash - && \
    apt-get install -y nodejs && \
    npm install -g db-migrate db-migrate-pg && \
    rm -rf /var/lib/apt/lists/*
