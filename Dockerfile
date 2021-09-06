FROM alpine:3.10

RUN apk add --update --no-cache openssh bash

COPY LICENSE README.md /

COPY entrypoint.sh /entrypoint.sh

WORKDIR /app

ENTRYPOINT ["/entrypoint.sh"]
