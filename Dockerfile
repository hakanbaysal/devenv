FROM debian:latest

ENV DEBIAN_FRONTEND noninteractive

# Update and install openssh-server, Docker, Go, PHP 7.4, Java, JDK, Nginx, Node.js, Git, net-tools, htop, telnet, lsof, maven, nano, vim, screen
RUN apt-get update && apt-get install -y openssh-server \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common \
    golang-go \
    php7.4 \
    php7.4-fpm \
    php7.4-cli \
    php7.4-gd \
    php7.4-mysql \
    php7.4-pgsql \
    php7.4-sqlite3 \
    php7.4-curl \
    php7.4-mbstring \
    php7.4-xml \
    php7.4-zip \
    default-jdk \
    nginx \
    nodejs \
    npm \
    git \
    net-tools \
    htop \
    telnet \
    lsof \
    maven \
    nano \
    vim \
    screen

RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash

RUN apt-get update && apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common -y && apt-get install ca-certificates curl gnupg lsb-release && mkdir -p /etc/apt/keyrings && curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg && echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null && apt-get update && chmod a+r /etc/apt/keyrings/docker.gpg && apt-get update && apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y && apt-get install docker-compose -y && docker --version && docker-compose --version

ENV PASSWORD=password

RUN sed -i 's/#PermitRootLogin.*/PermitRootLogin\ yes/' /etc/ssh/sshd_config
RUN sed -i 's/#PasswordAuthentication.*/PasswordAuthentication\ yes/' /etc/ssh/sshd_config

EXPOSE 22 80 443 8090 9000 9001 9002 9003 9004 9005 9006 9007 9008 9010

CMD ["/usr/sbin/sshd", "-D"]
ENTRYPOINT echo "root:${PASSWORD}" | chpasswd && service ssh restart && bash && dockerd