defmodule StacApiWeb.DefaultController do
  use StacApiWeb, :controller

  alias StacApi.Stac

  def index(conn, _params) do
    json(conn, %{:stac => "1.0.0", :env => "#{Mix.env()}"})
  end

  def root_catalog(conn, nil) do
    catalog = Stac.root_stac_catalog()
    render(conn, "catalog.json", catalog: catalog)
  end

  def root_catalog(conn, params) do
    params |> IO.inspect()

    unless params.pretty_please === "with_sugar_on_top" do
      raise "No means no"
    end

    text(conn, "Not done yet")
  end
end
