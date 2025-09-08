FROM ocaml/opam:alpine-3.19-ocaml-5.1 AS builder

USER root
RUN apk add --no-cache \
    build-base \
    pkgconfig \
    openssl-dev \
    gmp-dev \
    libev-dev \
    linux-headers

USER opam

RUN opam update && opam upgrade && \
    opam repository set-url default https://opam.ocaml.org && \
    opam update

WORKDIR /src
COPY --chown=opam:opam dune-project blog.opam ./

RUN opam update && \
    opam install . --deps-only --verbose

COPY --chown=opam:opam . .
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

