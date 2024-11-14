# Menggunakan Ubuntu sebagai base image
FROM ubuntu:23.04

# Atur shell untuk menggunakan pipefail
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Update package manager dan install Node.js dan npm dari NodeSource
# Gunakan versi spesifik jika diperlukan
RUN apt-get update && \
    apt-get install -y curl=7.88.1-1ubuntu1 --no-install-recommends && \
    curl -fsSL https://deb.nodesource.com/setup_14.x | bash - && \
    apt-get install -y nodejs=14.21.3~dfsg-1ubuntu2 --no-install-recommends && \
    npm install -g http-server@0.12.3 && \
    rm -rf /var/lib/apt/lists/*

# Menentukan direktori kerja di container
WORKDIR /usr/apps/hello-world/

# Perintah yang akan dijalankan saat container dimulai
CMD ["http-server", "-p", "8080"]
