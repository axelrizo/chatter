defmodule Chatter.Chat do
  alias Chatter.Chat
  alias Chatter.Repo

  def all_rooms do
    Chat.Room |> Repo.all()
  end
end
