# Intentionally insecure Dockerfile for security scanning tests

FROM ubuntu:latest

# Running as root (no USER instruction)

# Install packages with no version pinning
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    netcat \
    && rm -rf /var/lib/apt/lists/*

# Expose SSH port
EXPOSE 22

# Hardcoded environment variable
ENV DB_PASSWORD=admin123
ENV API_TOKEN=ghp_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

# Using ADD instead of COPY (can auto-extract and fetch URLs)
ADD https://example.com/app.tar.gz /app/

WORKDIR /app

CMD ["python", "app.py"]
