defmodule StacApi.STACFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `StacApi.STAC` context.
  """

  @doc """
  Generate a stac.
  """
  def stac_fixture(attrs \\ %{}) do
    {:ok, stac} =
      attrs
      |> Enum.into(%{

      })
      |> StacApi.STAC.create_stac()

    stac
  end
end
