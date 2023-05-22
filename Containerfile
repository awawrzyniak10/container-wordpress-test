FROM registry.access.redhat.com/ubi8/ubi-init
RUN dnf -y install httpd; dnf clean all; systemctl enable httpd;
COPY html/* /var/www/html
RUN cat /etc/redhat-release | sed -i '16r/dev/stdin' /var/www/html/index.html
RUN date | sed -i '20r/dev/stdin' /var/www/html/index.html
RUN mkdir /etc/systemd/system/httpd.service.d/; echo -e '[Service]\nRestart=always' > /etc/systemd/system/httpd.service.d/httpd.conf
EXPOSE 80
CMD [ "/sbin/init" ]
