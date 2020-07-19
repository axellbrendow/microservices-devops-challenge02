FROM golang:alpine3.12 AS builder

WORKDIR $GOPATH/src

COPY main.go .

RUN GOOS=linux GOARCH=amd64 go build -ldflags="-w -s" -o /go/bin/hello main.go

FROM scratch

COPY --from=builder /go/bin/hello /go/bin/hello

ENTRYPOINT [ "/go/bin/hello" ]
