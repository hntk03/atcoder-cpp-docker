FROM ubuntu:24.04

ENV DEVIAN_FRONTEND=noninteractive

# パッケージのインストール
RUN apt-get update && \ 
    apt-get install -y --no-install-recommends \
		g++ make && \
		rm -rf /var/lib/apt/lists/*

# ユーザーの作成
ARG USERNAME=builder
ARG USER_UID=1000
ARG USER_GID=$USER_UID

#RUN groupadd --gid $USER_GID $USERNAME
RUN useradd --uid $USER_UID --gid $USER_GID --create-home $USERNAME

# 作成したユーザーに切り替える
USER $USERNAME
RUN mkdir ${HOME}/work
WORKDIR /home/$USERNAME/work

CMD ["/bin/bash"]
