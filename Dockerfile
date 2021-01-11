FROM caddy:2-builder-alpine AS builder
RUN xcaddy build v2.3.0 \
  --with github.com/caddy-dns/cloudflare \
  --with github.com/kirsch33/realip \
  --with github.com/kirsch33/format-encoder
FROM caddy:2-alpine
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
ENV CLOUDFLARE_API_TOKEN=${CLOUDFLARE_API_TOKEN}
ENV ACMEEMAIL=${ACMEEMAIL}
ENV ASAK=${ASAK}
ENV XADMIN=${XADMIN}
