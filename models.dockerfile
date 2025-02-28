FROM alpine:latest
# 定义时区参数
ENV TZ=Asia/Shanghai

# 设置时区
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo '$TZ' > /etc/timezone

COPY models /home/app/models_bak

CMD [ "cp", "-r", "/home/app/models_bak", "/home/app/models" ]