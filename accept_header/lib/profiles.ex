defmodule Profiles do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec

    children = [
      supervisor(Profiles.Endpoint, []),
    ]

    opts = [strategy: :one_for_one, name: Profiles.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def config_change(changed, _new, removed) do
    Profiles.Endpoint.config_change(changed, removed)
    :ok
  end
end
