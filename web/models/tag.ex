defmodule PhxBkmark.Tag do
  use PhxBkmark.Web, :model

  schema "tags" do
    field :name, :string
    
    belongs_to :bookmark, PhxBkmark.Bookmark
    belongs_to :user, PhxBkmark.User
    timestamps
  end

  @required_fields ~w(name, bookmark_id, user_id)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If `params` are nil, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end

  alias PhxBkmark.Tag
end

