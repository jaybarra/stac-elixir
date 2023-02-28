defmodule StacApiWeb.Router do
  use StacApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", StacApiWeb do
    pipe_through :api
    get "/", DefaultController, :index
    post "/accounts/create", AccountController, :create
  end
end
