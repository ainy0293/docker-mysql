# mysql on docker


this is MySQL server run on docker container. MySQL version is 5.7.17

这是一个 Mysql 服务器，运行在 docker 容器里面，Mysql 版本是 5.7.17

container images is ubuntu 14.04，use mysql source code compile install mysql server in this images. 

容器是基于 ubuntu 14.04 的镜像， 在此镜像上使用了 MySQL 源代码编译安装mysql

modify the container ubuntu apt source to wangyi ( 163 ) source

修改容器内ubuntu的 apt 源为网易源

and modify MySQL root user accessible from any address, Set the MySQL root password to 123456

并且修改了 mysql root 用户可以从任意地址访问，设置 mysql root 密码为 123456

The MySQL configuration file to do a little optimization. Enabled Innodb engine and set default engine.

对 MySQL 配置文件，做了一点优化，启用了 Innodb 引擎，并将它设置成默认存储引擎


### make images:

enter source code directory and use command

	sudo docker build -t ainy/mysql:5.7.17 .

Option： `-t` this option specify image name, and tag

wait for it to finish

### see image

see image, use command

	sudo docker images

### Run container from mirror

use command
 
	sudo docker run -d -p 3306:3306 --name mysql-server -h mysql-server ainy/mysql:5.7.17

### see container

use command 

	sudo docker ps
