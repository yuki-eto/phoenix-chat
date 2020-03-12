FROM elixir:1.10

ENV NODE_VERSION 12.x
ENV PHOENIX_VERSION 1.4.15

RUN curl -sL https://deb.nodesource.com/setup_${NODE_VERSION} | bash \
  && apt-get install -y nodejs

RUN npm install npm@latest -g

RUN mix local.hex --force && \
  mix archive.install hex phx_new ${PHOENIX_VERSION} --force && \
  mix local.rebar --force

WORKDIR /app
