defmodule ConcurrentAcceptance.Post do
  use ConcurrentAcceptance.Web, :model

  schema "posts" do
    field :title, :string
    field :body, :string

    timestamps
  end

  @required_fields ~w(title body)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :invalid) do
    model
    |> cast(params, [:title, :body])
    |> validate_required([:title, :body])
  end
end
