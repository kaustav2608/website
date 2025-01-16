# Use an official Ubuntu base image
FROM ubuntu:20.04

# Set environment variable to avoid interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

# Install Apache, Git, curl, tzdata
RUN apt-get update && apt-get install -y \
    apache2 \
    git \
    curl \
    tzdata \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory for Apache to the default location
WORKDIR /var/www/html

# Ensure the directory has proper permissions for Apache to write to it
RUN chown -R www-data:www-data /var/www/html/ && chmod -R 755 /var/www/html/

# Expose port 80 (default HTTP port)
EXPOSE 80

# Copy the application files into the container
COPY . /var/www/html/

# Change ownership again in case files are copied with root permissions
RUN chown -R www-data:www-data /var/www/html/

# Start Apache server
CMD ["apache2ctl", "-D", "FOREGROUND"]
