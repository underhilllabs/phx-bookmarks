defmodule PhxBkmark.UserController do
  use PhxBkmark.Web, :controller
  import Ecto.Query, only: [from: 2]

  plug :action

  def index(conn, _params) do
    query = from u in PhxBkmark.User,
      limit: 10,
      offset: 0,
      select: u

    users = Repo.all(query)
    render(conn, "index.html", users: users)
  end

  def show(conn, %{"id" => id}) do
    user = Repo.get(PhxBkmark.User, id)
    render(conn, "show.html", user: user)
  end
end
