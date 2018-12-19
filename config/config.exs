# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :indiecampers,
  ecto_repos: [Indiecampers.Repo],
  gcp_api_key: System.get_env("INDIECAMPERS_GCP_API_KEY")

# Configures the endpoint
config :indiecampers, IndiecampersWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "znQLqiIc+vy0qwXC7FEy3md62MLsj0UBr8KVmGWYnhvZiTVAWsWmznNjKeFV67Sy",
  render_errors: [view: IndiecampersWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: Indiecampers.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
