defmodule PhxBkmark.UserController do
  use PhxBkmark.Web, :controller
  import Ecto.Query, only: [from: 2]

  plug :action

  def index(conn, _params) do
    query = from u in PhxBkmark.User,
      select: u

    users = Repo.all(query)
    render(conn, "index.html", users: users)
  end
end
