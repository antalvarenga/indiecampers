defmodule Indiecampers.App.Highlight do
  use Ecto.Schema
  import Ecto.Changeset

  schema "highlights" do
    field :address, :string
    field :city, :string
    field :latitude, :float
    field :longitude, :float
    field :name, :string
    field :website, :string
    field :country, :string
    field :description, :string

    timestamps()
  end

  @doc false
  def changeset(highlight, attrs) do
    highlight
    |> cast(attrs, [
      :name,
      :latitude,
      :longitude,
      :address,
      :city,
      :website,
      :country,
      :description
    ])
    |> validate_required([:name])
  end
end
