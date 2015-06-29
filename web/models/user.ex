defmodule PhxBkmark.User do
  use PhxBkmark.Web, :model

  schema "users" do
    field :username, :string
    field :fullname, :string
    field :email, :string
    field :password_digest, :string
    field :website, :string
    field :pic_url, :string
    
    has_many :bookmarks, PhxBkmark.Bookmark
    has_many :tags, PhxBkmark.Tag
    timestamps
  end

  @required_fields ~w(username, email)
  @optional_fields ~w(fullname, password_digest, website, pic_url)

  @doc """
  Creates a changeset based on the `model` and `params`.

  If `params` are nil, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end

  alias PhxBkmark.User
end

