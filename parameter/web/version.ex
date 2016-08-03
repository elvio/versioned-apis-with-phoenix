defmodule Profiles.Version do
  import Plug.Conn

  def init(versions), do: versions

  def call(%{params: %{"version" => version}}=conn, versions) do
    assign(conn, :version, Map.fetch!(versions, version))
  end
end
