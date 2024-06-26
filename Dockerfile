FROM amd64/alpine:3.20.1

ENV FRP_VERSION=0.58.1
ENV TZ=Asia/Shanghai
EXPOSE 10069

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories && \ 
    apk update && \
    apk add --no-cache wget tzdata && \
    ln -sf /usr/share/zoneinfo/$TZ /etc/localtime && \
    echo $TZ > /etc/timezone && \
    rm -rf /usr/local/*.apk /tmp/* /var/cache/apk/*

WORKDIR /frps

RUN wget -O frp.tar.gz https://github.com/fatedier/frp/releases/latest/download/frp_${FRP_VERSION}_linux_amd64.tar.gz && \
    tar -xzf frp.tar.gz --strip-components=1 && \
    rm frp.tar.gz && \
    rm frpc && \
    rm frpc.toml && \
    rm frps.toml && \
    rm LICENSE

COPY . .

CMD ["./frps", "-c", "frps.toml"]
