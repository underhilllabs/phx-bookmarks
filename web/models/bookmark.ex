defmodule PhxBkmark.Bookmark do
  use PhxBkmark.Web, :model

  schema "bookmarks" do
    field :title, :string
    field :url, :string
    field :desc, :string
    field :private, :boolean
    
    belongs_to :user, PhxBkmark.User, foreign_key: :user_id
    has_many :tags, PhxBkmark.Tag
    timestamps
  end

  @required_fields ~w(title, url, user_id)
  @optional_fields ~w(desc, private)

  @doc """
  Creates a changeset based on the `model` and `params`.

  If `params` are nil, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end

  alias PhxBkmark.Bookmark
end

