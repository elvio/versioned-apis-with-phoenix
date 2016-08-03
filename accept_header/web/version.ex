defmodule Profiles.Version do
  import Plug.Conn
  @versions Application.get_env(:plug, :mimes)

  def init(opts), do: opts

  def call(conn, _opts) do
    [accept] = get_req_header(conn, "accept")
    {:ok, [version]} = Map.fetch(@versions, accept)
    assign(conn, :version, version)
  end
end
