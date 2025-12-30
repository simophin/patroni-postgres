FROM docker.io/tensorchord/vchord-postgres:pg18-v1.0.0

ENV VENV_HOME="/venv"

ENV PATH="${VENV_HOME}/bin:${PATH}"

RUN apt update -y && \
    apt install --no-install-recommends -y \
    postgresql-postgis \
    postgresql-18-repack \
    postgresql-18-cron \
    python3-venv \
    gcc \
    pgbackrest \
    python3-dev && \
    python3 -m venv ${VENV_HOME} && \
    ${VENV_HOME}/bin/pip install patroni psycopg2-binary python-etcd && \
    apt clean && \
    apt remove -y gcc python3-dev && \
    apt auto-remove -y && \
    rm -rf /var/lib/apt/lists/*
