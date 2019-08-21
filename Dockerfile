FROM elixir:1.9.1

ENV LANG=C.UTF-8

RUN mix local.hex --force && mix local.rebar --force

RUN apt update \
    && apt install -y \
      curl \
      make \
      build-essential \
    && curl -sL https://deb.nodesource.com/setup_12.x | bash - \
    && apt update \
    && apt install -y nodejs \
    && rm -rf /var/lib/apt/lists/*

CMD ["bin/bash"]