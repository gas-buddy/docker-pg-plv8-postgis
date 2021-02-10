FROM clkao/postgres-plv8:12-2

ENV POSTGRES_USER=docker
ENV POSTGRES_PASSWORD=postgis

ENV POSTGIS_MAJOR 3
ENV POSTGIS_VERSION 3.1.1+dfsg-1.pgdg100+1

RUN apt-get update && \
    apt-get install -y --no-install-recommends curl ca-certificates postgresql-12-postgis-$POSTGIS_MAJOR=$POSTGIS_VERSION postgis=$POSTGIS_VERSION && \
    curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
    apt-get install -y nodejs && \
    npm install -g db-migrate db-migrate-pg && \
    rm -rf /var/lib/apt/lists/*
