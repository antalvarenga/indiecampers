defmodule IndiecampersWeb.HighlightController do
  use IndiecampersWeb, :controller

  alias Indiecampers.App
  alias Indiecampers.App.Highlight

  action_fallback IndiecampersWeb.FallbackController

  def index(conn, _params) do
    highlights = App.list_highlights()
    render(conn, "index.json", highlights: highlights)
  end

  def create(conn, %{"highlight" => highlight_params}) do
    with {:ok, %Highlight{} = highlight} <- App.create_highlight(highlight_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.highlight_path(conn, :show, highlight))
      |> render("show.json", highlight: highlight)
    end
  end

  def show(conn, %{"id" => id}) do
    highlight = App.get_highlight!(id)
    render(conn, "show.json", highlight: highlight)
  end

  def update(conn, %{"id" => id, "highlight" => highlight_params}) do
    highlight = App.get_highlight!(id)

    with {:ok, %Highlight{} = highlight} <- App.update_highlight(highlight, highlight_params) do
      render(conn, "show.json", highlight: highlight)
    end
  end

  def delete(conn, %{"id" => id}) do
    highlight = App.get_highlight!(id)

    with {:ok, %Highlight{}} <- App.delete_highlight(highlight) do
      send_resp(conn, :no_content, "")
    end
  end
end
