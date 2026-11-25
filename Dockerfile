# alpine must stay >= 3.21 for ocaml 5.3: alpine-3.19-ocaml-5.3 ships a
# 5.3.0+trunk dev snapshot (ocamlc -config without ocamlc_cflags) that
# breaks modern opam deps at build time.
FROM ocaml/opam:alpine-3.21-ocaml-5.3 AS builder

USER root
RUN apk add --no-cache \
    build-base \
    pkgconfig \
    openssl-dev \
    gmp-dev \
    libev-dev \
    linux-headers

USER opam

# NO `opam update` here on purpose. The image ships an opam-repository
# snapshot (2025-08) that is the universe this OCaml 5.3.0 release switch
# was built and tested against; dream/cohttp/ssl from that era produce a
# working binary. Updating to the 2026-11 universe builds a binary whose
# cohttp event loop goes blind on the GitHub API socket (requests hang
# forever, connection stuck in CLOSE_WAIT) and segfaults on some
# runtimes. The alpine-3.19 builder (5.3.0+trunk, no ocamlc_cflags) is
# ALSO broken: post-2024 packages fail to compile against it. Bump the
# builder image as a whole and re-verify the GitHub API fetch (curl /
# on a running container, expect HTTP 200 with post content) before
# shipping a new tag.

WORKDIR /src
COPY --chown=opam:opam dune-project blog.opam ./

RUN opam install . --deps-only

COPY --chown=opam:opam . .
RUN opam exec -- dune build --profile release

FROM alpine:3.24

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

