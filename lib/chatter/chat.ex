defmodule Chatter.Chat do
  alias Chatter.Chat.Room
  alias Chatter.Chat.Room.Message
  alias Chatter.Repo
  import Ecto.Query

  def all_rooms do
    Room |> Repo.all()
  end

  def new_chat_room do
    %Room{}
    |> Room.changeset(%{})
  end

  def create_chat_room(params) do
    %Room{}
    |> Room.changeset(params)
    |> Repo.insert()
  end

  def find_room(id) do
    Room |> Repo.get!(id)
  end

  def find_room_by_name(name) do
    Room |> Repo.get_by!(name: name)
  end

  def new_message(room, params) do
    room
    |> Ecto.build_assoc(:messages)
    |> Message.changeset(params)
    |> Repo.insert()
  end

  def room_messages(room) do
    Message
    |> where([m], m.chat_room_id == ^room.id)
    |> Repo.all()
  end
end
