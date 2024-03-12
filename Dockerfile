FROM postgres:16.2-bookworm

ENV VENV_HOME="/venv"

ENV PATH="${VENV_HOME}/bin:${PATH}"

RUN apt update -y && \
    apt install -y \
    postgresql-postgis \
    postgresql-contrib \
    postgresql-16-pgvector \
    postgresql-16-repack \
    postgresql-16-cron \
    python3-venv && \
    python3 -m venv ${VENV_HOME} && \
    ${VENV_HOME}/bin/pip install patroni psycopg2-binary python-etcd && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*
