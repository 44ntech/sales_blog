FROM alpine:3.22

RUN apk add --no-cache hugo git

WORKDIR /site
EXPOSE 1313

CMD ["hugo", "server", "--bind", "0.0.0.0", "--baseURL", "http://localhost:1313", "--disableFastRender"]
