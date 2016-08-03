defmodule Profiles.UserControllerTest do
  use Profiles.ConnCase
  alias Profiles.User

  setup %{conn: conn}=config do
    conn = put_req_header(conn, "accept", config.accept_header)
    {:ok, conn: conn}
  end

  @tag accept_header: "application/vnd.app.v1+json"
  test "GET /users/1 with Accept: application/vnd.app.v1+json", %{conn: conn} do
    user = User.build(:v1)
    conn = get(conn, "/users/1")
    response = json_response(conn, 200)

    assert response["id"] == user.id
    assert response["name"] == user.name
    assert response["favorite_sport"] == Enum.at(user.favorite_sports, 0)
  end

  @tag accept_header: "application/vnd.app.v2+json"
  test "GET /users/1 with Accept: application/vnd.app.v2+json", %{conn: conn} do
    user = User.build(:v2)
    conn = get(conn, "/users/1")
    response = json_response(conn, 200)

    assert response["id"] == user.id
    assert response["name"] == user.name
    assert response["favorite_sports"] == user.favorite_sports
  end
end
