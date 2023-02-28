defmodule StacApi.Repo do
  use Ecto.Repo,
    otp_app: :stac_api,
    adapter: Ecto.Adapters.Postgres
end
