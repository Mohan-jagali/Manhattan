FROM golang:1.20

WORKDIR /app
COPY . .

RUN go mod init backend && go mod tidy
EXPOSE 8282
CMD ["go", "run", "main.go"]

