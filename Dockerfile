# Menggunakan Ubuntu sebagai base image
FROM ubuntu:23.04

# Update package manager dan install Node.js dan npm
RUN apt-get update && \
    apt-get install -y nodejs=14.x npm=6.x --no-install-recommends && \
    npm install -g http-server@0.12.3 && \
    rm -rf /var/lib/apt/lists/*

# Menentukan direktori kerja di container
WORKDIR /usr/apps/hello-world/

# Perintah yang akan dijalankan saat container dimulai
CMD ["http-server", "-p", "8080"]
