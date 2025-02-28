FROM ubuntu:24.04
#定义时区参数
ENV TZ=Asia/Shanghai
#设置时区
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo '$TZ' > /etc/timezone

COPY docker/sources.list /etc/apt/sources.list
RUN apt-get update -y && apt-get install -y cmake build-essential libssl-dev zlib1g-dev libncurses5-dev libncursesw5-dev libreadline-dev libsqlite3-dev libgdbm-dev libdb5.3-dev libbz2-dev libexpat1-dev liblzma-dev tk-dev libffi-dev
COPY docker/Python-3.12.9.tgz /home/app/
ENV PATH=${PATH}:/usr/local/python/bin 
RUN tar -zxvf  /home/app/Python-3.12.9.tgz && cd Python-3.12.9 && ./configure --prefix=/usr/local/python
RUN  cd Python-3.12.9 && make && make install 



