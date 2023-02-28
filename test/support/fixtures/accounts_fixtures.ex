defmodule StacApi.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `StacApi.Accounts` context.
  """

  @doc """
  Generate a account.
  """
  def account_fixture(attrs \\ %{}) do
    {:ok, account} =
      attrs
      |> Enum.into(%{
        email: "some email",
        hash_password: "some hash_password"
      })
      |> StacApi.Accounts.create_account()

    account
  end
end
