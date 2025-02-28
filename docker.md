## docker环境构建
### 1. 安装docker
```
 sudo apt-get update
 sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

sudo echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://mirrors.ustc.edu.cn/docker-ce/linux/ubuntu/ \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io
sudo systemctl start docker
sudo systemctl enable docker
```
### 2. 构建镜像
#### 构建python环境
##### 1. 构建镜像
```
docker build -t python:3.12.9-ubuntu -f python.dockerfile .
```
##### 2.tag镜像并推送镜像
```
docker tag python:3.12.9-ubuntu registry.cn-shenzhen.aliyuncs.com/artcoding/python:3.12.9-ubuntu
docker push registry.cn-shenzhen.aliyuncs.com/artcoding/python:3.12.9-ubuntu
```
#### 构建comfyui环境
##### 1. 构建镜像
```
docker build -t comfyui:0.3.18-ubuntu -f comfyui.dockerfile .
```
##### 2.tag镜像并推送镜像
```
docker tag comfyui:0.3.18-ubuntu registry.cn-shenzhen.aliyuncs.com/artcoding/comfyui:0.3.18-ubuntu
docker push registry.cn-shenzhen.aliyuncs.com/artcoding/comfyui:0.3.18-ubuntu
```

#### 构建模型包镜像
##### 1. 构建镜像
```
docker build -t comfyui-models:0.1 -f models.dockerfile .
```
##### 2.tag镜像并推送镜像
```
docker tag comfyui-models:0.1 registry.cn-shenzhen.aliyuncs.com/artcoding/comfyui-models:0.1
docker push registry.cn-shenzhen.aliyuncs.com/artcoding/comfyui-models:0.1
```