defmodule Indiecampers.App.HighlightCalculator do
  # Gets the closest POI from a geo point
  def get_closest_poi(longitude, latitude) do
    {longitude, _} = Float.parse(longitude)
    {latitude, _} = Float.parse(latitude)

    {poi, _distance} =
      Enum.map(Indiecampers.App.Highlight.data(), fn poi ->
        {poi,
         distance(
           longitude,
           poi.longitude,
           latitude,
           poi.latitude
         )}
      end)
      |> Enum.min_by(fn {poi, distance} -> distance end)

    poi
  end

  # Gets POI's near the fastest route
  def get_route_pois(api_response) do
    {:ok,
     %{
       "routes" => [
         %{
           "overview_polyline" => %{"points" => polyline},
           "legs" => [
             %{"distance" => %{"value" => distance_m}}
           ]
         }
       ]
     }} = api_response

    distance_km = distance_m / 1000

    # Transforms the polyline string in a list of coordinates
    points = Polyline.decode(polyline)

    {ratio, halvings} = best_points_km_ratio(Enum.count(points), distance_km)

    remove_points(points, halvings)
    |> get_close_pois()
    |> Enum.uniq()
  end

  # Finds the number of halvings of the geo points list which makes the ratio points/distance closer to 0.010
  # This is done to reduce computing time, as it's not necessary to find nearby POI's for each point in the polyline,
  # as these points are very close to each other
  defp best_points_km_ratio(points, distance_km, acc \\ [])

  defp best_points_km_ratio(points, _distance_km, acc) when points <= 5 do
    # reversing, index corresponds to number of halvings

    Enum.reverse(acc)
    |> Enum.with_index()
    |> IO.inspect()
    |> Enum.min_by(fn {ratio, _index} -> abs(ratio - 0.010) end)
  end

  defp best_points_km_ratio(points, distance_km, acc) do
    ratio = points / distance_km
    acc = [ratio | acc]
    best_points_km_ratio(points / 2, distance_km, acc)
  end

  # Cuts the list of the polyline geo points in half [halvings] times
  defp remove_points(points, halvings) when halvings === 0, do: points

  defp remove_points(points, halvings) do
    1..halvings
    |> Enum.reduce(points, fn _x, acc -> Enum.drop_every(acc, 2) end)
  end

  # Returns a list of POI's within a distance of 1.000 to any polyline point, calculated with
  # coordinates in degrees (approximately 100km).
  defp get_close_pois(points) do
    data = Indiecampers.App.Highlight.data()

    for {x1, y1} <- points,
        poi <- data,
        distance(x1, poi.longitude, y1, poi.latitude) <= 1.000,
        do: poi
  end

  # distance between two points in cartesian coordinates
  defp distance(x1, x2, y1, y2) do
    :math.pow(:math.pow(x2 - x1, 2) + :math.pow(y2 - y1, 2), 0.5)
  end
end
