#####################################
#                                   #
#         bmryu0501/myubuntu        #
#         for linux on docker       #
#                                   #
#####################################

FROM ubuntu:latest
LABEL maintainer="Byeongmin Ryoo <bmryu0501@gmail.com>"


## update & upgrade
RUN set -xe \
    && apt -y -qq update \
    && apt -y -qq upgrade

## set time zone
RUN set -xe \
    && apt -y -qq install tzdata
ENV TZ=Asia/Seoul
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime \
    && echo $TZ > /etc/timezone

## set locale UTF-8
RUN apt -y -qq install locales \
    && locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

## ubuntu unminimize
RUN yes | unminimize

## install extensions ##
# vim: text editor
# tmux: split screen
# wget: file downloader
# tar: zip, unzip
# man: linux manual
# sudo: superuser do
# net-tools: network tools (ifconfig etc...)
# git: git
# build-essential: generaly used packages for building source codes
# libcurses-perl: libraries for perl
# python3: python3
# python3-pip: python library downloader (pip3)
# curl: transferring data from or to a server designed to work without user interaction
RUN set -xe \
    && apt -y -qq install vim tmux wget tar man sudo net-tools libcurses-perl git build-essential python3 python3-pip curl

## Customizing vim ##
WORKDIR "/root"
RUN set -xe \
    # cloning Vundle(vim bundle, plugin manager) from github
    && git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim \
    # download .vimrc file from my github (what I've made)
    && wget -O ./.vimrc https://raw.githubusercontent.com/KkoalaB/myUbuntu/master/configuration%20files/.vimrc \
    # cloning gruvbox (scheme)
    && git clone https://github.com/morhetz/gruvbox.git ~/.vim/bundle/gruvbox \
    # vim plugin installation
    && vim -c 'PluginInstall' -c 'qa!'
    # set environment variable 'TERM'
ENV TERM=xterm-256color

# Oh-My-Zsh (zsh)
RUN sh -c "$(wget -O- https://github.com/deluan/zsh-in-docker/releases/download/v1.1.2/zsh-in-docker.sh)" -- \
    -t fox \
    -p git \
    -p https://github.com/zsh-users/zsh-autosuggestions \
    -p https://github.com/zsh-users/zsh-completions \
    -a export TERM=xterm-256color
    # TODO: .zshrc 만들어서 이거도 클론 해야될듯

CMD ["zsh"]