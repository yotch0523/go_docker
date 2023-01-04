FROM golang:1.20rc1-buster

ARG USER_NAME
ARG GROUP_NAME
ARG UID
ARG GID
ARG USER_PASSWORD
ARG TZ

ENV TZ=$TZ
ENV DEBIAN_FRONTEND=noninteractive

RUN ln -sf /usr/share/zoneinfo/$TZ /etc/localtime
RUN apt-get update -y && apt-get install -y --no-install-recommends binutils build-essential sysstat golang \ 
vim fonts-takao fio qemu-kvm virt-manager libvirt-clients virtinst jq  libvirt-daemon-system sudo

RUN curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

RUN go install golang.org/x/tools/gopls@latest

# add sudo user
RUN groupadd -g $GID $GROUP_NAME && \
    useradd -m -s /bin/bash -u $UID -g $GID -G sudo $USER_NAME && \
    echo $USER_NAME:$USER_PASSWORD | chpasswd && \
    echo "$USER_NAME   ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

RUN apt-get autoremove -y

RUN adduser `id -un` libvirt
RUN adduser `id -un` libvirt-qemu
RUN adduser `id -un` kvm

# cutomize vim
COPY ./docker/app/config/vim/.vimrc /root/.vimrc
COPY ./docker/app/config/vim/.vim /root/.vim
RUN vim -c PlugInstall -c q -c q

USER $USER_NAME

WORKDIR /home/$USER_NAME