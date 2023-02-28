defmodule StacApiWeb.UserView do
  use StacApiWeb, :view
  alias StacApiWeb.UserView

  def render("index.json", %{users: users}) do
    %{data: render_many(users, UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{
      id: user.id,
      full_name: user.full_name,
      biography: user.biography
    }
  end
end