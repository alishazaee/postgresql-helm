FROM postgres:16


RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    python3-dev \
    && pip3 install patroni[etcd] \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*


RUN mkdir -p /etc/patroni


COPY patroni.yml /etc/patroni/patroni.yml

EXPOSE 5432 8008

CMD ["patroni", "/etc/patroni/patroni.yml"]
