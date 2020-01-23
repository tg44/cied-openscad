FROM golang:1.13

WORKDIR /app

RUN apt-get update && apt-get -y install openscad && rm -rf /var/lib/apt/lists/*

COPY go.mod go.sum ./
RUN go mod download

COPY . .

RUN go build -o main .

CMD ["./main"]
