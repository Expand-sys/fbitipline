defmodule Fbittipline.Submissions.Submission do
  use Ecto.Schema
  import Ecto.Changeset
  @derive {Jason.Encoder, only: [:id, :title, :body, :inserted_at, :updated_at]}

  schema "submissions" do
    field :title, :string
    field :body, :string

    timestamps()
  end

  def changeset(submission, attrs) do
    submission
    |> cast(attrs, [:title, :body])
    |> validate_required([:title, :body])
  end
end
