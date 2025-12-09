# Stage 1: Build the Go binary
# We use a larger image with all the Go tools to compile the code
FROM golang:alpine AS builder
WORKDIR /app
COPY . .
RUN go build -o my-app main.go

# Stage 2: Create the final production image
# We copy ONLY the compiled binary to a tiny Alpine Linux image
# This reduces image size from ~800MB to ~15MB (Google Standard)
FROM alpine:latest
WORKDIR /root/
COPY --from=builder /app/my-app .
CMD ["./my-app"]