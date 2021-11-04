FROM ubuntu:latest
LABEL maintainer="Byeongmin Ryoo <bmryu0501@gmail.com>"


# update & upgrade
RUN set -xe \
    && apt -y -qq update \
    && apt -y -qq upgrade

# set time zone
RUN set -xe \
    && apt -y -qq install tzdata
ENV TZ=Asia/Seoul
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime \
    && echo $TZ > /etc/timezone

# set locale UTF-8
RUN apt -y -qq install locales \
    && locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# ubuntu unminimize
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
