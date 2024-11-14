# Dockerfile
FROM golang:1.23.3-alpine

# Set up the working directory inside the container
WORKDIR /app

# RUN curl -sSfL https://raw.githubusercontent.com/cosmtrek/air/master/install.sh | sh -s -- -b $(go env GOPATH)/bin
RUN go install github.com/air-verse/air@latest
RUN air init

# Copy go.mod and go.sum files for dependency management
# COPY go.mod go.sum ./

# Download dependencies
# RUN go mod download && go mod verify

# Copy application source code
COPY . .

# Expose the app port (8080 in this example)
# EXPOSE 8080

# Start the Go app
# CMD ["go", "run", "main.go"]
# CMD ["/mqtt-simulator"]
CMD ["air"]