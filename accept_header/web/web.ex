defmodule Profiles.Web do
  def controller do
    quote do
      use Phoenix.Controller
      import Profiles.Router.Helpers
    end
  end

  def view do
    quote do
      use Phoenix.View, root: "web/templates"
      import Profiles.Router.Helpers
      import Profiles.ErrorHelpers
    end
  end

  def router do
    quote do
      use Phoenix.Router
    end
  end

  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end
