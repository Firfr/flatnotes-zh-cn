FROM dullage/flatnotes:v5.5.4

## 复制入口文件

COPY 代码/entrypoint.sh /entrypoint.sh

## 复制前端

COPY 代码/dist /app/client

## 复制后端

COPY 代码/global_config.py /app/server
COPY 代码/file_system.py /app/server

## 安装 jieba
RUN pip install jieba -i https://mirrors.aliyun.com/pypi/simple

## 标签

LABEL 原项目地址="https://github.com/dullage/flatnotes"
LABEL 镜像制作者="https://space.bilibili.com/17547201"
LABEL GitHub主页="https://github.com/Firfr/flatnotes-zh-cn"
LABEL Gitee主页="https://gitee.com/firfe/flatnotes-zh-cn"

## docker build -t firfe/flatnotes_zh-cn:5.5.4 .
