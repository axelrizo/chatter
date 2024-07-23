defmodule Chatter.Chat.Room do
  use Ecto.Schema
  import Ecto.Changeset
  alias Chatter.Chat.Room.Message

  schema "chat_rooms" do
    field :name, :string
    has_many :messages, Message, foreign_key: :chat_room_id

    timestamps()
  end

  def changeset(struct, attrs) do
    struct
    |> cast(attrs, [:name])
    |> validate_required([:name])
    |> unique_constraint(:name)
  end
end
