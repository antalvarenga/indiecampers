defmodule IndiecampersWeb.Router do
  use IndiecampersWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", IndiecampersWeb do
    pipe_through :api

    resources "/highlights", HighlightController, except: [:new, :edit]
  end
end
