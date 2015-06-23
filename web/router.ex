defmodule PhxBkmark.Router do
  use PhxBkmark.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PhxBkmark do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/bookmarks", BookmarkController, :index
    get "/bookmarks/new", BookmarkController, :new
    post "/bookmarks/new", BookmarkController, :create
  end

  # Other scopes may use custom stacks.
  # scope "/api", PhxBkmark do
  #   pipe_through :api
  # end
end
