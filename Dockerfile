FROM golang:1.13.0 as dev

WORKDIR /workspace
COPY . .

RUN CGO_ENABLED=0 GOOS=linux go build -o longcat .

FROM alpine:latest as run

COPY --from=dev /workspace/longcat /longcat

CMD ["/longcat"]

