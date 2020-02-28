# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

# Configures the endpoint
config :phoenix_controller_plug_guard_gen_bug, PhoenixControllerPlugGuardGenBugWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "MkAVYt2jQhhgYV7vFOcW7tR3K4cbuUG1nvP95sEct7IQL7lM4qcIcZLdAx+CXO15",
  render_errors: [view: PhoenixControllerPlugGuardGenBugWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: PhoenixControllerPlugGuardGenBug.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [signing_salt: "S8Sd5eiG"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
