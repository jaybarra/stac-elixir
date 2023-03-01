defmodule StacApiWeb.Auth.Pipeline do
  use Guardian.Plug.Pipeline,
    otp_app: :stac_api,
    module: StacApiWeb.Auth.Guardian,
    error_handler: StacApiWeb.Auth.GuardianErrorHandler

  plug Guardian.Plug.VerifySession
  plug Guardian.Plug.VerifyHeader
  plug Guardian.Plug.EnsureAuthenticated
  plug Guardian.Plug.LoadResource
end
