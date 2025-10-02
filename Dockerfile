FROM docker:28.0.4

COPY --from=golang:1.25.1-alpine /usr/local/go /usr/local/go

RUN apk add --no-cache git ca-certificates && update-ca-certificates

ENV GOROOT=/usr/local/go \
    GOPATH=/go \
    PATH=/usr/local/go/bin:/go/bin:$PATH

RUN mkdir -p "$GOPATH"/{bin,src,pkg} && go version