defmodule PhxBkmark.SessionController do
  use PhxBkmark.Web, :controller

  plug :action

  def new(conn, _params) do
    changeset = User.changeset(%User{})
    render conn, changeset: changeset
  end

  def register(conn, _params) do
    render conn, "register.html"
  end

  def sign_in(conn, _params) do
    render conn, "sign_in.html"
  end

  def sign_out(conn, _params) do
    render conn, "index.html"
  end

end
