FROM ubi9/ubi
MAINTAINER Ricardo Alonso <ralonso@redhat.com>
RUN yum install -y httpd && yum clean all
RUN sed -i 's/Listen.*/Listen 8080/' /etc/httpd/conf/httpd.conf && \
    chown -R 1001:0 /var/www/html /var/log/httpd /run/httpd && \
    chmod -R g=u /var/www/html /var/log/httpd /run/httpd
EXPOSE 8080
USER 1001
RUN echo "This is my first apache container for Openshift" > /var/www/html/index.html
RUN ["httpd","-d","FOREGROUND"]
