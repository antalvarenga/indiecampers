defmodule IndiecampersWeb.HighlightView do
  use IndiecampersWeb, :view
  alias IndiecampersWeb.HighlightView

  def render("index.json", %{highlights: highlights}) do
    %{data: render_many(highlights, HighlightView, "highlight.json")}
  end

  def render("show.json", %{highlight: highlight}) do
    %{data: render_one(highlight, HighlightView, "highlight.json")}
  end

  def render("highlight.json", %{highlight: highlight}) do
    %{id: highlight.id,
      name: highlight.name,
      latitude: highlight.latitude,
      longitude: highlight.longitude,
      address: highlight.address,
      city: highlight.city,
      website: highlight.website}
  end
end
