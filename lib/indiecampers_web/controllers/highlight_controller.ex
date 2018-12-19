defmodule IndiecampersWeb.HighlightController do
  use IndiecampersWeb, :controller

  alias Indiecampers.App
  alias Indiecampers.App.Highlight
  alias Indiecampers.App.HighlightCalculator

  action_fallback IndiecampersWeb.FallbackController

  # Search by fastest route on Google maps
  def index(conn, params) do
    poi_or_pois =
      if Map.has_key?(params, "origin") and Map.has_key?(params, "destination") do
        origin = params["origin"]
        destination = params["destination"]

        response =
          HTTPoison.get!(
            "https://maps.googleapis.com/maps/api/directions/json?origin=#{origin}&destination=#{
              destination
            }&key=AIzaSyCJA3klnvwU6gxYVk-JFFCv2G08IQgKvA0"
          )

        # IO.puts(
        #   "============================================= response ============================================="
        # )
        # 
        # IO.inspect(response)
        decoded_response = Jason.decode(response.body)

        IO.puts(
          "============================================= decoded response ============================================="
        )

        pois = HighlightCalculator.get_route_pois(decoded_response)
        render(conn, "index.json", highlights: pois)
      else
        poi = HighlightCalculator.get_closest_poi(params["longitude"], params["latitude"])
        render(conn, "show.json", highlight: poi)
      end
  end

  # Search the nearest POI from a geo point.
  def index(conn, %{"longitude" => longitude, "latitude" => latitude} = _params) do
    poi = HighlightCalculator.get_closest_poi(longitude, latitude)
    render(conn, "index.json", highlights: poi)
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
