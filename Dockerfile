FROM elixir:1.7
COPY . /app/
WORKDIR "/app"
ENTRYPOINT ["/app/entrypoint"]
