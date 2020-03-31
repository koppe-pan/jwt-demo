defmodule Phx13Gdn10Web.SessionView do
  use Phx13Gdn10Web, :view

  def render("sign_in.json", %{user: user, jwt: jwt}) do
    %{"token": jwt}
  end

  def render("error.json", %{message: msg}) do
    %{"error": msg}
  end
end
