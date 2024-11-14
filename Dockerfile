# Menggunakan Ubuntu sebagai base image
FROM ubuntu:23.04

# Update package manager dan install Node.js dan npm
RUN apt-get update && \
    apt-get install -y curl && \
    curl -fsSL https://deb.nodesource.com/setup_14.x | bash - && \
    apt-get install -y nodejs --no-install-recommends && \
    npm install -g http-server@0.12.3 && \
    rm -rf /var/lib/apt/lists/*

# Menentukan direktori kerja di container
WORKDIR /usr/apps/hello-world/

# Perintah yang akan dijalankan saat container dimulai
CMD ["http-server", "-p", "8080"]
