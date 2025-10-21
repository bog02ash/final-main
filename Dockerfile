FROM golang:1.24.4
 
WORKDIR /app

COPY go.mod go.sum ./

COPY *.go ./

COPY tracker.db ./

RUN go mod download

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o /my_app

CMD ["/my_app"]