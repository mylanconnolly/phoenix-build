FROM ubuntu:bionic

ENV LANG=C.UTF-8

ENV BUILD_DATE="2019-12-10"

RUN apt update \
    && apt upgrade -qy \
    && apt install -qy \
       curl \
       make \
       build-essential \
       git \
       software-properties-common \
       rsync \
    && add-apt-repository ppa:longsleep/golang-backports \
    && echo "deb http://apt.postgresql.org/pub/repos/apt/ bionic-pgdg main" > /etc/apt/sources.list.d/pgdg.list \
    && curl -sL https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - \
    && curl -sL https://deb.nodesource.com/setup_12.x | bash - \
    && curl -O https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb \
    && dpkg -i erlang-solutions_1.0_all.deb \
    && rm erlang-solutions_1.0_all.deb \
    && apt update \
    && apt install -qy \
       golang-go \
       mariadb-client-10.1 \
       postgresql-client-12 \
       nodejs \
       esl-erlang \
    && apt install -qy elixir \
    && rm -rf /var/lib/apt/lists/*

RUN mix local.hex --force && mix local.rebar --force

CMD ["bin/bash"]
