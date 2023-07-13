FROM centos:latest

# Install Apache server
RUN yum install httpd -y && \
    systemctl start httpd

# Download website
RUN yum install wget -y && \
    wget -P /var/www/html https://www.free-css.com/assets/files/free-css-templates/download/page286/deni.zip

# Unzip the file
RUN yum install unzip -y && \
    unzip -o /var/www/html/deni.zip -d /var/www/html/

# Copy the files to Apache default directory
RUN cp -Rf /var/www/html/html/* /var/www/html

# Expose port 80
EXPOSE 80

# Start Apache server
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
