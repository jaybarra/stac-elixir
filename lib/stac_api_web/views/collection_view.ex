defmodule StacApiWeb.CollectionView do
  use StacApiWeb, :view
  alias StacApiWeb.CollectionView

  def render("collection.json", %{collection: collection}) do
    %{
      type: "Collection",
      stac_version: "1.0.0",
      stac_extensions: [],
      id: collection.id,
      links: []
    }
  end
end
