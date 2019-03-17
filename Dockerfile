FROM golang:alpine3.6 AS binary
ADD . /app
WORKDIR /app
RUN go build -o http

FROM alpine:3.6
WORKDIR /app
ARG PORT=8000
ENV PORT ${PORT}
EXPOSE ${PORT}
COPY --from=binary /app/http /app
CMD ["/app/http"]
