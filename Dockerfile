FROM alpine:3.16.2 as environment

RUN apk update && apk upgrade

FROM environment as build_environment

RUN apk add --no-cache build-base

FROM build_environment as builder

WORKDIR /socks_proxy

COPY ./ ./

RUN make

FROM environment

WORKDIR /socks_proxy

COPY --from=builder /socks_proxy/proxy ./

EXPOSE 1080

ENTRYPOINT ["/bin/sh", "-c", "/socks_proxy/proxy -a $AUTHTYPE -u $USERNAME -p $PASSWORD"]
