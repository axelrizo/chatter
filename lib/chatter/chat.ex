defmodule Chatter.Chat do
  alias Chatter.Chat.Room
  alias Chatter.Repo

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
end
