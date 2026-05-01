FROM debian:bookworm-slim

ARG HUGO_VERSION=0.148.2
ARG TARGETARCH

RUN apt-get update \
    && apt-get install -y --no-install-recommends ca-certificates curl git tar \
    && rm -rf /var/lib/apt/lists/* \
    && case "$TARGETARCH" in \
        arm64) HUGO_ARCH="linux-arm64" ;; \
        amd64) HUGO_ARCH="linux-amd64" ;; \
        *) echo "Unsupported architecture: $TARGETARCH" && exit 1 ;; \
    esac \
    && curl -fsSL -o /tmp/hugo.tar.gz "https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_${HUGO_ARCH}.tar.gz" \
    && tar -C /usr/local/bin -xzf /tmp/hugo.tar.gz hugo \
    && chmod +x /usr/local/bin/hugo \
    && rm /tmp/hugo.tar.gz

WORKDIR /site
EXPOSE 1313

CMD ["hugo", "server", "--bind", "0.0.0.0", "--baseURL", "http://localhost:1313", "--disableFastRender"]
