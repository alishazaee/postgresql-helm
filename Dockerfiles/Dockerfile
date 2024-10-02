FROM postgres:14.1

# Install dependencies
RUN apt-get update &&  apt install -y python3-pip \
    && pip install patroni && pip install psycopg2-binary

RUN mkdir -p /etc/patroni && chown postgres. /etc/patroni

USER postgres

ENV PGPASSWORD=password

# Create a directory for Patroni configuration

# Copy the Patroni configuration template (modify as needed)
COPY patroni.yaml /etc/patroni/patroni.yml

# Set the entrypoint to start Patroni
ENTRYPOINT ["patroni", "/etc/patroni/patroni.yml"]

# Expose PostgreSQL port
EXPOSE 5432 8008
