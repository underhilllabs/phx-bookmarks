defmodule PhxBkmark.BookmarkController do
  use PhxBkmark.Web, :controller
  import Ecto.Query, only: [from: 2]

  plug :action

  def index(conn, _params) do
    query = from b in PhxBkmark.Bookmark,
      limit: 30,
      select: b

    bookmarks = Repo.all(query) |> Repo.preload [:user]
    render(conn, "index.html", bookmarks: bookmarks)
  end

  def new(conn, _params) do
    render conn, "new.html"
  end

  # We will use the params, so no _!
  def create(conn, params) do
    render conn, "index.html"
  end
end
