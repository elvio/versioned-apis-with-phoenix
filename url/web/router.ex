defmodule Profiles.Router do
  use Profiles.Web, :router

  pipeline :v1 do
    plug :accepts, ["json"]
    plug Profiles.Version, version: :v1
  end

  pipeline :v2 do
    plug :accepts, ["json"]
    plug Profiles.Version, version: :v2
  end

  scope "/v1", Profiles do
    pipe_through :v1
    resources "/users", UserController, only: [:show]
  end

  scope "/v2", Profiles do
    pipe_through :v2
    resources "/users", UserController, only: [:show]
  end
end
