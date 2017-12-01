# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :slek,
  ecto_repos: [Slek.Repo]

# Configures the endpoint
config :slek, Slek.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "zCAPg5AzHvTyirjCCxsmfJViL4MqocYTKM3yIus2VYt2ls1yIXh/IpUmCBi0TwVB",
  render_errors: [view: Slek.ErrorView, accepts: ~w(json)],
  pubsub: [name: Slek.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :guardian, Guardian,
  issuer: "Slek",
  ttl: {30, :days},
  verify_issuer: true,
  serializer: Slek.GuardianSerializer

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
