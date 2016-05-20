# "ported" by Adam Miller <maxamillion@fedoraproject.org> from
#   https://github.com/fedora-cloud/Fedora-Dockerfiles
#
# Originally written for Fedora-Dockerfiles by
#   scollier <scollier@redhat.com>

FROM centos:centos7
MAINTAINER d-theus https://github.com/d-theus

RUN yum -y update; yum -y install epel-release; yum clean all
RUN yum -y install nginx; yum clean all

VOLUME ["/etc/nginx", "/etc/ssl/certs"]

EXPOSE 80
EXPOSE 443

# ADD nginx.conf /etc/nginx/nginx.conf

CMD [ "/usr/sbin/nginx" ]

