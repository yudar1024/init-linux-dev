FROM ubuntu:jammy
USER root
ENV PYENV_VERSION=3.11.6
ARG DEBIAN_FRONTEND=noninteractive
ARG TZ=Asia/UTC
WORKDIR /root
RUN ["/bin/sh", "-c", "cp /etc/apt/sources.list /etc/apt/sources.list_bak"]
# COPY sources.list /etc/apt/sources.list
RUN sed -i s/archive.ubuntu.com/mirrors.aliyun.com/g /etc/apt/sources.list && sed -i s/security.ubuntu.com/mirrors.aliyun.com/g /etc/apt/sources.list && sed -i s/ports.ubuntu.com/mirrors.aliyun.com/g /etc/apt/sources.list
RUN ["apt", "update"]
RUN ["/bin/sh", "-c", "apt upgrade -y"]
RUN ["/bin/sh", "-c", "apt-get install zsh -y"]
RUN ["/bin/sh", "-c", "  chsh -s /bin/zsh"]
RUN ["/bin/sh", "-c", "  apt install git curl vim tmux htop wget unzip net-tools -y"]
RUN apt-get -y install tzdata
RUN ["/bin/sh", "-c", "  apt install build-essential libbz2-dev libffi-dev liblzma-dev libncursesw5-dev libreadline-dev libsqlite3-dev libssl-dev libxml2-dev libxmlsec1-dev llvm tk-dev make xz-utils zlib1g-dev -y"]
# RUN wget https://github.com/Schniz/fnm/releases/download/v1.35.1/fnm-arm64.zip
# RUN unzip fnm-arm64.zip
# RUN chmod +x fnm && ./fnm env
RUN mkdir .fnm
COPY fnm .fnm
RUN chmod +x .fnm/fnm
RUN echo 'eval "$(~/.fnm/fnm env --use-on-cd)"' >> ~/.zshrc 
RUN echo 'export PATH="$HOME/.fnm:$PATH"' >> ~/.zshrc
RUN ["/bin/zsh","-c","source ~/.zshrc && fnm install --node-dist-mirror https://mirrors.tuna.tsinghua.edu.cn/nodejs-release/ --lts"]
RUN ["/bin/zsh","-c","~/.fnm/fnm completions --shell zsh"]
RUN ["/bin/zsh","-c","git clone https://gitee.com/mirrors/pyenv.git ~/.pyenv"]
RUN echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
RUN echo '[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
RUN echo 'eval "$(pyenv init -)"' >> ~/.zshrc
RUN mkdir ~/.pip
COPY pip.conf .pip
RUN mkdir ~/.pyenv/cache
RUN wget -P ~/.pyenv/cache https://repo.huaweicloud.com/python/3.11.6/Python-3.11.6.tar.xz
RUN ["/bin/zsh","-c","source ~/.zshrc && pyenv -h && cd && pyenv install 3.11.6"]
RUN ["/bin/zsh","-c","source ~/.zshrc && pip install --user pipenv"]
RUN echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.zshrc
RUN ["/bin/zsh","-c","source ~/.zshrc && npm config set registry https://registry.npmmirror.com"]
RUN ["/bin/zsh","-c","source ~/.zshrc && npm install -g pnpm"]
EXPOSE 3000
EXPOSE 8000
# usage
# step 1 create voluem
# docker volume create --driver local --opt type=none --opt o=bind --opt device=/Users/rogercc/dev/webapp/nextjs-study mywork
# step 2 run docker
# docker run -it --privileged -P --rm  --mount type=volume,source=mywork,target=/root/webapp/nextjs-study devcontainer-arm64
# create volume on docker run directly
# docker run -it --rm --mount type=volume,dst=/container/path,volume-driver=local,volume-opt=type=none,volume-opt=o=bind,volume-opt=device=/home/user/test foo