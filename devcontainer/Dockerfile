FROM ubuntu:jammy
USER root
RUN ["/bin/sh", "-c", "cp /etc/apt/sources.list /etc/apt/sources.list_bak"]
# COPY sources.list /etc/apt/sources.list
RUN sed -i s/archive.ubuntu.com/mirrors.aliyun.com/g /etc/apt/sources.list && sed -i s/security.ubuntu.com/mirrors.aliyun.com/g /etc/apt/sources.list && sed -i s/ports.ubuntu.com/mirrors.aliyun.com/g /etc/apt/sources.list
RUN cat /etc/apt/sources.list
RUN ["apt", "update"]
RUN ["/bin/sh", "-c", "apt upgrade -y"]
RUN ["/bin/sh", "-c", "apt-get install zsh -y"]
RUN ["/bin/sh", "-c", "  chsh -s /bin/zsh"]
RUN ["/bin/sh", "-c", "  apt install git -y"]
RUN ["/bin/sh", "-c", "  apt install curl -y"]
RUN ["/bin/sh", "-c", "  apt install vim -y"]
RUN ["/bin/sh", "-c", "  apt install tmux -y"]
RUN ["/bin/sh", "-c", "  apt install wget -y"]
RUN ["/bin/sh", "-c", "  apt install unzip -y"]
RUN ["/bin/sh", "-c", "  apt install htop -y"]
RUN ["/bin/sh", "-c", "  apt install net-tools -y"]
RUN ["/bin/sh", "-c", "  apt install tree -y"]
#RUN ["/bin/sh", "-c", "  apt install openssh-server -y"]
#RUN ["/bin/sh", "-c", "  apt install openssh-client -y"]
