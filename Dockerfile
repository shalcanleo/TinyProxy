FROM alpine
LABEL maintainer="刺猬 <cuihailiang@gmail.com>"

ENV VERSION 1.0

RUN set -xe && \
    apk add tzdata && \
    cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    echo "Asia/Shanghai" > /etc/timezone && \
    apk del tzdata

RUN set -xe && apk add --no-cache tinyproxy

COPY tinyproxy.conf  /etc/tinyproxy/tinyproxy.conf

EXPOSE 443

CMD ["tinyproxy", "-d"]
