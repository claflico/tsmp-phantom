FROM alpine:3.12

ENV PHANTOM_VERSION=0.5.2 \
    SERVER=UNSET 

WORKDIR /tsmp

RUN set -ex && \
    apk update && apk --no-cache upgrade && \
    apk add --no-cache bash curl && \
    curl -s -L https://github.com/jhead/phantom/releases/download/v${PHANTOM_VERSION}/phantom-linux-x64 -o phantom && \
    chmod +x phantom && \
    apk del curl && \
    rm -rf /var/cache/apk/*

ADD entrypoint.sh .

EXPOSE 19132/udp

CMD ["/tsmp/entrypoint.sh"]
