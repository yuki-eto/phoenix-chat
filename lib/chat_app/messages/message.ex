defmodule ChatApp.Messages.Message do
  use Ecto.Schema
  import Ecto.Changeset

  schema "messages" do
    field :host, :string
    field :message, :string
    field :posted_at, :naive_datetime

    timestamps()
  end

  @doc false
  def changeset(message, attrs) do
    message
    |> cast(attrs, [:message, :host, :posted_at])
    |> validate_required([:message, :host, :posted_at])
  end
end
