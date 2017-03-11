FROM ubuntu:14.04
MAINTAINER Ainy Min email: ainy@ifool.me website: http://ifool.me
ENV REFRESHED_AT 2017-03-12
ENV PATH $PATH:/usr/local/mysql/bin
ADD src/ /root
WORKDIR /root
RUN ./mysql_install.sh
VOLUME ["/usr/local/mysql/data"]
EXPOSE 3306
CMD ["/usr/share/mysql.startup.sh"]

