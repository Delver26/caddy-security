FROM caddy:builder AS builder

LABEL org.opencontainers.image.title=authp
LABEL org.opencontainers.image.description="Authentication Portal"
LABEL org.opencontainers.image.url=https://github.com/greenpau/caddy-security
LABEL org.opencontainers.image.source=https://github.com/greenpau/caddy-security
LABEL org.opencontainers.image.version=1.1.18
LABEL maintainer="greenpau"

RUN xcaddy build --with github.com/greenpau/caddy-security@v1.1.18 --with github.com/greenpau/caddy-trace --with github.com/crewjam/saml@v0.4.10=github.com/greenpau/origin_crewjam_saml@v0.4.11-0.20221229165346-936eba92623a
FROM caddy:latest
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
