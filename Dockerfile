FROM ocaml/opam:alpine-3.18-ocaml-5.1 AS builder

USER root
RUN apk add --no-cache \
    build-base \
    pkgconfig \
    openssl-dev \
    gmp-dev \
    libev-dev \
    linux-headers

USER opam

RUN opam update && opam upgrade

WORKDIR /src
COPY --chown=opam:opam . .

RUN opam install . --deps-only --verbose || \
    (opam update && opam install . --deps-only --verbose) || \
    (sleep 10 && opam install . --deps-only --verbose)
RUN opam exec -- dune build --profile release

FROM alpine:3.18

RUN apk add --no-cache \
    openssl \
    gmp \
    libev \
    ca-certificates

RUN addgroup -g 1001 -S appgroup && \
    adduser -u 1001 -S appuser -G appgroup

COPY --from=builder /src/_build/default/src/main.exe /usr/local/bin/blog
RUN chmod +x /usr/local/bin/blog

USER appuser

EXPOSE 8080

CMD ["blog"]

