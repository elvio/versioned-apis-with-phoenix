defmodule Profiles.UserController do
  use Profiles.Web, :controller
  alias Profiles.User

  def show(%{assigns: %{version: :v1}}=conn, _params) do
    user = User.build(:v1)
    render conn, "show.v1.json", user: user
  end
  def show(%{assigns: %{version: :v2}}=conn, _params) do
    user = User.build(:v2)
    render conn, "show.v2.json", user: user
  end
end
