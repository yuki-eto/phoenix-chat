# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :chat_app,
  ecto_repos: [ChatApp.Repo]

# Configures the endpoint
config :chat_app, ChatAppWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Zc67TGrNZev5W3adBRyqdOk6Inc907Bm79rld6CZcbFrraeI2/zKsv/fXGzlndPP",
  render_errors: [view: ChatAppWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: ChatApp.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [signing_salt: "crRfE2wq"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
