defmodule Chatter.Accounts do
  alias Chatter.User
  alias Chatter.Repo
  alias Doorman.Auth.Secret

  def change_user(user) do
    User.changeset(user, %{})
  end

  def create_user(params) do
    %User{}
    |> User.changeset(params)
    |> Secret.put_session_secret()
    |> Repo.insert()
  end
end
