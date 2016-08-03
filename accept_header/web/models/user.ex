defmodule Profiles.User do
  defstruct id: nil, name: nil, favorite_sports: nil

  def build(:v1), do: _build(["Ski"])
  def build(:v2), do: _build(["Ski", "Sailing"])

  defp _build(favorite_sports) do
    %__MODULE__{
      id: 1,
      name: "John Doe",
      favorite_sports: favorite_sports
    }
  end
end
