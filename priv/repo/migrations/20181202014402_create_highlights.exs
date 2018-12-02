defmodule Indiecampers.Repo.Migrations.CreateHighlights do
  use Ecto.Migration

  def change do
    create table(:highlights) do
      add :name, :string
      add :latitude, :float
      add :longitude, :float
      add :address, :string
      add :city, :string
      add :website, :string
      add :country, :string
      add :description, :text

      timestamps()
    end

  end
end
