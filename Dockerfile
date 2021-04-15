ARG VERSION=2.4.0-beta.2
FROM caddy:${VERSION}-builder-alpine AS builder
ARG VERSION
RUN xcaddy build v${VERSION} \
  --with github.com/caddy-dns/cloudflare
FROM caddy:${VERSION}-alpine
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
