defmodule PhxBkmark.BookmarkController do
  use PhxBkmark.Web, :controller
  import Ecto.Query, only: [from: 2]
  @per_page 20
  plug :action

  def index(conn, params) do
    page = Map.get(params, "page", "1") |> String.to_integer
    
    bookmarks = bookmark_query |> paginate(page, @per_page) |> Repo.all |> Repo.preload [:user, :tags]
    render(conn, "index.html", bookmarks: bookmarks)
  end

  def new(conn, _params) do
    render conn, "new.html"
  end

  # We will use the params, so no _!
  def create(conn, params) do
    render conn, "index.html"
  end

  def bookmark_query do
    from b in PhxBkmark.Bookmark,
    order_by: [desc: b.updated_at],
    select: b
  end

  def paginate(query, page, per_page) do
    offset = (page - 1) * per_page
    from query,
    offset: ^offset,
    limit: ^per_page
  end
end
