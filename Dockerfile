From centos:latest
MAINTAINER avishek.8016293999@gmail.com
RUN yum install -y httpd \
  zip \
 unzip
ADD https://www.free-css.com/assets/files/free-css-templates/download/page293/bricker.zip /var/www/html/
WORKDIR /var/www/html
RUN unzip bricker.zip
RUN cp -rvf bricker/* .
RUN rm -rf bricker bricker.zip
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80	
