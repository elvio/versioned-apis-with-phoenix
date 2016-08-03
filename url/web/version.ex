defmodule Profiles.Version do
  import Plug.Conn
  @versions Application.get_env(:plug, :mimes)

  def init(opts), do: opts

  def call(conn, opts) do
    assign(conn, :version, opts[:version])
  end
end
