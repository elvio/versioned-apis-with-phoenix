defmodule Profiles.Router do
  use Profiles.Web, :router

  pipeline :api do
    plug :accepts, [:v1, :v2]
    plug Profiles.Version
  end

  scope "/", Profiles do
    pipe_through :api
    resources "/users", UserController, only: [:show]
  end
end
