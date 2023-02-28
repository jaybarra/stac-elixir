defmodule StacApi.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      StacApi.Repo,
      # Start the Telemetry supervisor
      StacApiWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: StacApi.PubSub},
      # Start the Endpoint (http/https)
      StacApiWeb.Endpoint,
      # Start a worker by calling: StacApi.Worker.start_link(arg)
      # {StacApi.Worker, arg}
      {Finch, name: Cmr}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: StacApi.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    StacApiWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
