FROM local/c7-systemd
# RUN yum -y install httpd; yum clean all

RUN yum install -y httpd

RUN yum install -y \
    epel-release \
    yum-utils \
    openssh-server \
    openssh-clients \
    mysql-community-server

RUN yum-config-manager --enable remi-php73

RUN yum install -y \
    php \
    php-common \
    php-opcache \
    php-mcrypt \
    php-cli \
    php-gd \
    php-curl \
    php-mysqlnd

RUN yum install -y \
    https://files.freeswitch.org/repo/yum/centos-release/freeswitch-release-repo-0-1.noarch.rpm epel-release \
    freeswitch-config-vanilla freeswitch-lang-* freeswitch-sounds-*

RUN yum install -y \
    sendmail \
    sendmail-cf \
    m4

RUN yum install -y \ 
    https://service.ictinnovations.com/repo/7/ict-release-7-4.el7.centos.noarch.rpm \
    http://files.freeswitch.org/freeswitch-release-1-6.noarch.rpm \
    epel-release \
    install ictcore \
    ictcore-fax \
    ictcore-email \
    ictfax
RUN yum clean all

RUN systemctl enable httpd.service
# RUN systemctl enable freeswitch<div class="open_grepper_editor" title="Edit & Save To Grepper"></div>
# RUN service sshd start
# RUN service sshd enable
# RUN service sshd status



VOLUME [ "/sys/fs/cgroup" ]
EXPOSE 80 8080
CMD ["/usr/sbin/init"]
# CMD ["/usr/sbin/sshd", "-D"]

# RUN getenforce
# RUN setenforce 0