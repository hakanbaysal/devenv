# devenv

This is development docker container for out workers.

You can use openssh-server, Docker, Go, PHP 7.4, Java, JDK, Nginx, Node.js, Git, net-tools, htop, telnet, lsof, maven, nano, vim, screen libraries in this container.

## How to use

```bash
docker pull hakanbysal/devenv:latest
```

```bash
docker run -d \
  --name hakanbaysal \
  --privileged \
  -p 23:22 \
  -e "PASSWORD=password" \
  -v /sites/hakanbaysal:/sites \
  hakanbysal/devenv:latest
```