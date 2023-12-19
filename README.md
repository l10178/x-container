# x-container

自定义容器镜像，支持常用工具类，方便快速开始和测试。

## 镜像说明

各镜像层级和依赖如下。

```console
[layer0]   base-debian
           │
[layer1]   └─── graalvm-debian
               │
[layer2]       └───graalvm-maven
               │
[layer2]       └───graalvm-tomcat
```

## 镜像构建

我们使用 argo-workflows 构建镜像。你也可以参考 docker-build.sh 构建自己的镜像。

## 遇到问题和解决方案

- Dockerfile 内执行 curl 报错如下。

    ```console

    curl: (77) error setting certificate file: /etc/ssl/certs/ca-certificates.crt

    ```

    解决方式： 执行 `apt install ca-certificates` 命令。