defmodule Phx13Gdn10Web.UserView do
  use Phx13Gdn10Web, :view
  alias Phx13Gdn10Web.UserView

  def render("index.json", %{users: users}) do
    %{data: render_many(users, UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{id: user.id,
      email: user.email,
      name: user.name,
      phone: user.phone,
      password_hash: user.password_hash,
      is_admin: user.is_admin}
  end
end
