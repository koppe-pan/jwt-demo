# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :phx13_gdn10,
  ecto_repos: [Phx13Gdn10.Repo]

# Configures the endpoint
config :phx13_gdn10, Phx13Gdn10Web.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "HiJcXK4R7tVFfYUa0KFdeRGtyhQ5d5jfqc3SEKQH+dqvsg69mulnEHV3YVQ3MWNR",
  render_errors: [view: Phx13Gdn10Web.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Phx13Gdn10.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Guardian
config :phx13_gdn10, Phx13Gdn10.Guardian,
  issuer: "phx13_gdn10",
  secret_key: "JyYJAQd8tTdGefo12u0Y4wz0883BzftRcjAwpwyGipFo9+eJ15ZsMhMeeRk+t8nW"

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
