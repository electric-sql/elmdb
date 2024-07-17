FROM elixir:1.7
COPY . /app/
WORKDIR "/app"
RUN mix compile.erlang
ENTRYPOINT ["/app/entrypoint"]
