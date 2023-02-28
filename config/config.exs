# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :stac_api,
  ecto_repos: [StacApi.Repo],
  generators: [binary_id: true]

# Configures the endpoint
config :stac_api, StacApiWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [view: StacApiWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: StacApi.PubSub,
  live_view: [signing_salt: "NeR7PABu"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :stac_api, StacApiWeb.Auth.Guardian,
  issuer: "stac_api",
  secret_key: "wsLm/LQtjjsts4B/R3hHoHEspp/wEGKqf2lM2r4NM3VQh8dfzWa0Rm4PoRbu5tVw"

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
