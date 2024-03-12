FROM postgres:16.2-bookworm

RUN apt update -y && apt install -y \
    patroni \
    postgresql-postgis \
    postgresql-contrib \
    postgresql-16-pgvector \
    postgresql-16-repack \
    postgresql-16-repmgr \
    postgresql-16-cron && \
    apt clean -y && apt autoremove -y && rm -rf /var/lib/apt/lists/*