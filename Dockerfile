FROM ubuntu:bionic

ENV LANG=C.UTF-8

ENV BUILD_DATE="2019-09-06"

RUN apt update \
    && apt upgrade -qy \
    && apt install -qy \
       curl \
       make \
       build-essential \
       git \
       software-properties-common \
    && add-apt-repository ppa:longsleep/golang-backports \
    && apt update \
    && apt install -qy golang-go \
    && curl -sL https://deb.nodesource.com/setup_12.x | bash - \
    && apt update \
    && curl -O https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb \
    && dpkg -i erlang-solutions_1.0_all.deb \
    && rm erlang-solutions_1.0_all.deb \
    && apt update \
    && apt install -qy esl-erlang \
    && apt install -qy elixir nodejs \
    && rm -rf /var/lib/apt/lists/*

RUN mix local.hex --force && mix local.rebar --force

CMD ["bin/bash"]
