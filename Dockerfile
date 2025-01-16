# Use an official Ubuntu base image
FROM ubuntu:20.04

# Set environment variable to avoid interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

# Install Apache and necessary utilities
RUN apt-get update && apt-get install -y \
    apache2 \
    git \
    curl \
    tzdata \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory for Apache to the default location
WORKDIR /var/www/html

# Ensure proper ownership for /var/www/html (to avoid permission issues)
RUN chown -R www-data:www-data /var/www/html/

# Expose port 80 (default HTTP port)
EXPOSE 80

# Copy the application files into the container
# This can be adjusted if you want to exclude .git or other unnecessary files
COPY . /var/www/html/

# Configure Apache to start
CMD ["apachectl", "-D", "FOREGROUND"]
