# 🚀 frps-docker

本仓库包含了使用自定义配置运行 [frp](https://github.com/fatedier/frp)（Fast Reverse Proxy）服务端 (`frps`) 的 Docker 设置。构建镜像过程中自动下载相关软件，可以在 Dockerfile 中指定任意支持 toml 格式配置文件的 frp 版本，并且镜像大小只有不到 30 M。非常简单，可以作为学习 Docker 的示例。 

## 🛠️ 先决条件

- Docker
- Docker Compose

## 🪄 使用方式

1. 🖥️ 克隆仓库

    ```bash
    git clone https://github.com/Jerry-FaGe/frps-docker.git
    ```

2. 📂 进入目录

    ```bash
    cd frps-docker
    ```

3. 🚀 构建 & 运行

    ```bash
    docker-compose up -d
    ```

这将使用 `frps.toml` 中指定的配置在 Docker 容器中启动 `frps` 服务。

##  🌐 访问 Web 控制台

可以使用配置文件中指定的凭据在 http://<你的服务器 IP>:7100 访问 frp 的 Web 管理界面：

- 用户名: `admin`
- 密码: `xxxxxx`

## 📝 配置

`frps` 的配置在 `frps.toml` 文件中指定。以下是一个示例配置：

```toml
bindPort = 7000
auth.token = "xxxxxx"  # 设置一个用于身份验证的令牌，所有客户端都要在配置中设置相同的令牌

webServer.addr = "0.0.0.0"
webServer.port = 7100
webServer.user = "admin"  # 可随意指定
webServer.password = "xxxxxx"
```
你可以根据需要自定义 `frps.toml` 文件。可用的配置项详见 [frp 文档](https://gofrp.org/zh-cn/docs/)。

## 🛠️ 故障排除

如果遇到问题，可以查看 `frps` 容器的日志：

```bash
docker logs -f frps
```
或者定位至 `docker-compose.yml` 所在文件夹使用：

```bash
docker-compose logs -f
```

## 📄 许可证
此项目使用 MIT 许可证。详情请参阅 LICENSE 文件。

## 🙏 致谢

- [frp](https://github.com/fatedier/frp)
- [frp 官方文档](https://gofrp.org/zh-cn/docs/)
