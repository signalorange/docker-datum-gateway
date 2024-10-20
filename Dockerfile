# Use a base image with Ubuntu
FROM ubuntu:latest

# Install dependencies
RUN apt-get update && apt-get install -y \
    cmake \
    pkg-config \
    libjansson-dev \
    libmicrohttpd-dev \
    libsodium-dev \
    libcurl4-openssl-dev \
    git \
    build-essential

# Set working directory
WORKDIR /app

# Clone the repository 
RUN git clone --depth 1 --branch v0.2beta https://github.com/OCEAN-xyz/datum_gateway.git .

# Build the project
RUN cmake . && make

# Expose necessary ports
EXPOSE 3333

# Set the entrypoint
ENTRYPOINT ["./datum_gateway"]

# Default command (can be overridden)
CMD ["-c", "/config/datum_gateway_config.json"]