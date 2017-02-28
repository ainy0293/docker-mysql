FROM ubuntu:14.04
MAINTAINER Ainy Min email: ainy@ifool.me website: http://ifool.me
ENV REFRESHED_AT 2017-02-11
ENV PATH $PATH:/usr/local/mysql/bin
ADD mysql_install.sh /root
ADD sources.list.trusty /etc/apt/sources.list
COPY boost_1_59_0.tar.gz /root
COPY mysql-5.7.17.tar.gz /root
WORKDIR /root
RUN ./mysql_install.sh
RUN /etc/init.d/mysql start \
	&& mysql -uroot -e "grant all privileges on *.* to 'root'@'%' identified by '123456';" \
	&& mysql -uroot -e "grant all privileges on *.* to 'root'@'localhost' identified by '123456';" \
	&& /etc/init.d/mysql stop \
	&& rm -rf /tmp/mysql.sock.lock
EXPOSE 3306
CMD ["/usr/share/mysql.startup.sh"]

