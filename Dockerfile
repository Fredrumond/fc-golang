# Primeira etapa
FROM golang:alpine AS builder

WORKDIR /go/src/app

COPY . .

RUN go mod init example.com/hello

RUN go get -d -v

RUN go build -o /go/bin/hello

#Segunda etapa
FROM scratch

COPY --from=builder /go/bin/hello /go/bin/hello

ENTRYPOINT ["/go/bin/hello"]