defmodule Profiles.UserControllerTest do
  use Profiles.ConnCase
  alias Profiles.User

  test "GET /v1/users/1", %{conn: conn} do
    user = User.build(:v1)
    conn = get(conn, "/v1/users/1")
    response = json_response(conn, 200)

    assert response["id"] == user.id
    assert response["name"] == user.name
    assert response["favorite_sport"] == Enum.at(user.favorite_sports, 0)
  end

  test "GET /v2/users/1", %{conn: conn} do
    user = User.build(:v2)
    conn = get(conn, "/v2/users/1")
    response = json_response(conn, 200)

    assert response["id"] == user.id
    assert response["name"] == user.name
    assert response["favorite_sports"] == user.favorite_sports
  end
end
