# Use the official Ubuntu base image
FROM ubuntu:22.04

# Prevent interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Update package list and install Apache HTTP server
RUN apt-get update && \
    apt-get install -y apache2 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copy the index.html file to Apache's default web root
COPY index.html /var/www/html/

# Start Apache in the foreground when the container starts
CMD ["apachectl", "-D", "FOREGROUND"]

# Ex
