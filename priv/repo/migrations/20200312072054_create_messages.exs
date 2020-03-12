defmodule ChatApp.Repo.Migrations.CreateMessages do
  use Ecto.Migration

  def change do
    create table(:messages) do
      add :message, :string
      add :host, :string
      add :posted_at, :naive_datetime

      timestamps()
    end

  end
end
