defmodule Indiecampers.AppTest do
  use Indiecampers.DataCase

  alias Indiecampers.App

  describe "highlights" do
    alias Indiecampers.App.Highlight

    @valid_attrs %{address: "some address", city: "some city", latitude: 120.5, longitude: 120.5, name: "some name", website: "some website"}
    @update_attrs %{address: "some updated address", city: "some updated city", latitude: 456.7, longitude: 456.7, name: "some updated name", website: "some updated website"}
    @invalid_attrs %{address: nil, city: nil, latitude: nil, longitude: nil, name: nil, website: nil}

    def highlight_fixture(attrs \\ %{}) do
      {:ok, highlight} =
        attrs
        |> Enum.into(@valid_attrs)
        |> App.create_highlight()

      highlight
    end

    test "list_highlights/0 returns all highlights" do
      highlight = highlight_fixture()
      assert App.list_highlights() == [highlight]
    end

    test "get_highlight!/1 returns the highlight with given id" do
      highlight = highlight_fixture()
      assert App.get_highlight!(highlight.id) == highlight
    end

    test "create_highlight/1 with valid data creates a highlight" do
      assert {:ok, %Highlight{} = highlight} = App.create_highlight(@valid_attrs)
      assert highlight.address == "some address"
      assert highlight.city == "some city"
      assert highlight.latitude == 120.5
      assert highlight.longitude == 120.5
      assert highlight.name == "some name"
      assert highlight.website == "some website"
    end

    test "create_highlight/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = App.create_highlight(@invalid_attrs)
    end

    test "update_highlight/2 with valid data updates the highlight" do
      highlight = highlight_fixture()
      assert {:ok, %Highlight{} = highlight} = App.update_highlight(highlight, @update_attrs)
      assert highlight.address == "some updated address"
      assert highlight.city == "some updated city"
      assert highlight.latitude == 456.7
      assert highlight.longitude == 456.7
      assert highlight.name == "some updated name"
      assert highlight.website == "some updated website"
    end

    test "update_highlight/2 with invalid data returns error changeset" do
      highlight = highlight_fixture()
      assert {:error, %Ecto.Changeset{}} = App.update_highlight(highlight, @invalid_attrs)
      assert highlight == App.get_highlight!(highlight.id)
    end

    test "delete_highlight/1 deletes the highlight" do
      highlight = highlight_fixture()
      assert {:ok, %Highlight{}} = App.delete_highlight(highlight)
      assert_raise Ecto.NoResultsError, fn -> App.get_highlight!(highlight.id) end
    end

    test "change_highlight/1 returns a highlight changeset" do
      highlight = highlight_fixture()
      assert %Ecto.Changeset{} = App.change_highlight(highlight)
    end
  end
end
