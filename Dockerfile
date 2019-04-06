FROM golang:1.11-alpine3.8 AS binary
ADD . /app
WORKDIR /app
RUN go build -o http

FROM alpine:3.8
WORKDIR /app
ARG PORT=8000
ENV PORT ${PORT}
EXPOSE ${PORT}
COPY --from=binary /app/http /app
CMD ["/app/http"]
