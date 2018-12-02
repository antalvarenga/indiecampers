defmodule Indiecampers.Repo do
  use Ecto.Repo,
    otp_app: :indiecampers,
    adapter: Ecto.Adapters.Postgres
end
