defmodule StacApiWeb.ItemView do
  use StacApiWeb, :view
  alias StacApiWeb.ItemView

  def render("item.json", %{item: item}) do
    %{
      type: "Item",
      stac_version: "1.0.0",
      stac_extensions: [],
      id: item.id,
      links: []
    }
  end
end
