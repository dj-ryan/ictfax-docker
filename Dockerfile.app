FROM local/c7-systemd
# RUN yum -y install httpd; yum clean all

RUN yum install -y \
    httpd \
    tomcat \
    tomcat-javadoc.noarch \
    tomcat-docs-webapp.noarch \
    tomcat-admin-webapps.noarch
RUN yum install -y \ 
    https://service.ictinnovations.com/repo/7/ict-release-7-4.el7.centos.noarch.rpm \
    http://files.freeswitch.org/freeswitch-release-1-6.noarch.rpm \
    epel-release \
    install ictcore \
    ictcore-fax \
    ictcore-email \
    ictfax
RUN yum clean all
RUN systemctl enable tomcat.service
RUN systemctl enable httpd.service
VOLUME [ "/sys/fs/cgroup" ]
EXPOSE 80 8080
CMD ["/usr/sbin/init"]