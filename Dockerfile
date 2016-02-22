# "ported" by Adam Miller <maxamillion@fedoraproject.org> from
#   https://github.com/fedora-cloud/Fedora-Dockerfiles
#
# Originally written for Fedora-Dockerfiles by
#   scollier <scollier@redhat.com>

FROM centos:centos7
MAINTAINER d-theus https://github.com/d-theus

RUN yum -y update; yum clean all
RUN yum -y install epel-release tar ; yum clean all
RUN yum -y install nginx ; yum clean all
ADD server.crt /etc/ssl/certs/
ADD server.key /etc/ssl/certs/
RUN curl https://git.centos.org/sources/httpd/c7/acf5cccf4afaecf3afeb18c50ae59fd5c6504910 \
    | tar -xz -C /usr/share/nginx/html \
    --strip-components=1
RUN sed -i -e 's/Apache/nginx/g' -e '/apache_pb.gif/d' \ 
    /usr/share/nginx/html/index.html

EXPOSE 80
EXPOSE 443

# ADD nginx.conf /etc/nginx/nginx.conf

# CMD [ "/usr/sbin/nginx" ]

