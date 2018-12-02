defmodule IndiecampersWeb.HighlightControllerTest do
  use IndiecampersWeb.ConnCase

  alias Indiecampers.App
  alias Indiecampers.App.Highlight

  @create_attrs %{
    address: "some address",
    city: "some city",
    latitude: 120.5,
    longitude: 120.5,
    name: "some name",
    website: "some website"
  }
  @update_attrs %{
    address: "some updated address",
    city: "some updated city",
    latitude: 456.7,
    longitude: 456.7,
    name: "some updated name",
    website: "some updated website"
  }
  @invalid_attrs %{address: nil, city: nil, latitude: nil, longitude: nil, name: nil, website: nil}

  def fixture(:highlight) do
    {:ok, highlight} = App.create_highlight(@create_attrs)
    highlight
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all highlights", %{conn: conn} do
      conn = get(conn, Routes.highlight_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create highlight" do
    test "renders highlight when data is valid", %{conn: conn} do
      conn = post(conn, Routes.highlight_path(conn, :create), highlight: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.highlight_path(conn, :show, id))

      assert %{
               "id" => id,
               "address" => "some address",
               "city" => "some city",
               "latitude" => 120.5,
               "longitude" => 120.5,
               "name" => "some name",
               "website" => "some website"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.highlight_path(conn, :create), highlight: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update highlight" do
    setup [:create_highlight]

    test "renders highlight when data is valid", %{conn: conn, highlight: %Highlight{id: id} = highlight} do
      conn = put(conn, Routes.highlight_path(conn, :update, highlight), highlight: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.highlight_path(conn, :show, id))

      assert %{
               "id" => id,
               "address" => "some updated address",
               "city" => "some updated city",
               "latitude" => 456.7,
               "longitude" => 456.7,
               "name" => "some updated name",
               "website" => "some updated website"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, highlight: highlight} do
      conn = put(conn, Routes.highlight_path(conn, :update, highlight), highlight: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete highlight" do
    setup [:create_highlight]

    test "deletes chosen highlight", %{conn: conn, highlight: highlight} do
      conn = delete(conn, Routes.highlight_path(conn, :delete, highlight))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.highlight_path(conn, :show, highlight))
      end
    end
  end

  defp create_highlight(_) do
    highlight = fixture(:highlight)
    {:ok, highlight: highlight}
  end
end
