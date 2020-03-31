use Mix.Config

# Configure your database
config :phx13_gdn10, Phx13Gdn10.Repo,
  username: "postgres",
  password: "postgres",
  database: "phx13_gdn10_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :phx13_gdn10, Phx13Gdn10Web.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
