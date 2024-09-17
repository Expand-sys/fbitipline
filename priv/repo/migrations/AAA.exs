defmodule Fbittipline.Repo.Migrations.CreateSubmissions do
  use Ecto.Migration

  def change do
    create table(:submissions) do
      add :title, :string, null: false
      add :body, :text, null: false

      timestamps()
    end
  end
end
