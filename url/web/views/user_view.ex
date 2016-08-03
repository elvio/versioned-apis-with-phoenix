defmodule Profiles.UserView do
  use Profiles.Web, :view

  def render("show.v1.json", %{user: user}) do
    %{
      id: user.id,
      name: user.name,
      favorite_sport: Enum.at(user.favorite_sports, 0)
    }
  end
  def render("show.v2.json", %{user: user}) do
    %{
      id: user.id,
      name: user.name,
      favorite_sports: user.favorite_sports
    }
  end
end
