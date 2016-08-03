defmodule Profiles.Router do
  use Profiles.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
    plug Profiles.Version, %{"v1" => :v1, "v2" => :v2}
  end

  scope "/", Profiles do
    pipe_through :api
    resources "/users", UserController, only: [:show]
  end
end
