FROM ubuntu

COPY LICENSE README.md /

COPY entrypoint.sh /entrypoint.sh

WORKDIR /app

ENTRYPOINT ["/entrypoint.sh"]
