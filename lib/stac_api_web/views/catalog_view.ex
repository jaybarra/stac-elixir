defmodule StacApiWeb.CatalogView do
  use StacApiWeb, :view

  def render("catalog.json", %{catalog: catalog}) do
    %{
      type: "Catalog",
      stac_version: "1.0.0",
      stac_extensions: [],
      id: catalog.id,
      title: catalog.title,
      description: catalog.description,
      links: []
    }
  end
end
