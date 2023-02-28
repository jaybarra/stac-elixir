defmodule StacApi.Stac do
  @doc """
  Returns the root catalog
  """
  def root_stac_catalog do
    %{
      :title => "Elixir Based STAC Catalog"
    }
  end

  @doc """
  Returns the root catalog
  """
  def root_cloudstac_catalog do
    %{
      :title => "Elixir Based CLOUD STAC Catalog"
    }
  end
end
