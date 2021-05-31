FROM centos:7

LABEL maintainer="bamiks@gmail.com"
LABEL description="Docker image based on Centos with some software as ngnix, php, git etc"

RUN rpm -Uvh http://nginx.org/packages/centos/7/noarch/RPMS/nginx-release-centos-7-0.el7.ngx.noarch.rpm

RUN yum install -y epel-release \
    nginx \
    busybox\
    php-mysql \
    php-fpm \
    nano \
    wget \
    curl \
    git \
    htop \
    vim \
    supervisor \
    mysql-client \
    redis-tools \
    tzdata \

&&  yum clean all

RUN cp /usr/share/zoneinfo/Europe/Kiev /etc/localtime

CMD /usr/sbin/php-fpm -D && /usr/sbin/nginx -g 'daemon off;'

EXPOSE 80



