FROM golang as builder

COPY ./app /usr/src/app

WORKDIR /usr/src/app

RUN go build

FROM scratch

COPY --from=builder /usr/src/app/hello .

ENTRYPOINT [ "./hello" ]