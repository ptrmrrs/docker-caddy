FROM caddy:2-builder-alpine AS builder
RUN xcaddy build v2.4.0-beta.2 \
  --with github.com/caddy-dns/cloudflare
FROM caddy:2-alpine
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
ENV CLOUDFLARE_API_TOKEN=${CLOUDFLARE_API_TOKEN}
ENV ACMEEMAIL=${ACMEEMAIL}
ENV ASAK=${ASAK}
ENV XADMIN=${XADMIN}
