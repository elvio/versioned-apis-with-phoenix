# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :profiles, Profiles.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Zbi1uzqvqdcML8+V1cxBKzfkno3HKxQdYtPD98jVktkofEAV7BPmyBgIweZoQAw0",
  render_errors: [view: Profiles.ErrorView, accepts: ~w(json)],
  pubsub: [name: Profiles.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :plug, :mimes, %{
  "application/vnd.app.v1+json" => [:v1],
  "application/vnd.app.v2+json" => [:v2]
}

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
