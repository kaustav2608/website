FROM ubuntu:latest

# Install Apache
RUN apt-get update && apt-get install -y apache2

# Copy website files to Apache root directory
COPY . /var/www/html

# Expose port 80
EXPOSE 80

# Start Apache in the foreground
CMD ["apache2ctl", "-D", "FOREGROUND"]

