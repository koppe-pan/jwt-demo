defmodule Phx13Gdn10Web.SessionController do
  use Phx13Gdn10Web, :controller

  alias Phx13Gdn10.Users.User

  def sign_in(conn, %{"session" => %{"email" => email, "password" => password}}) do
    case User.find_and_confirm_password(email, password) do
      {:ok, user} ->
        {:ok, jwt, _full_claims} = Phx13Gdn10.Guardian.encode_and_sign(user)
        # {:ok, claims} = Phx13Gdn10.Guardian.decode_and_verify(jwt)
        # IO.inspect(claims)

        conn
        |> render("sign_in.json", user: user, jwt: jwt)
      {:error, _reason} ->
        conn
        |> put_status(401)
        |> render("error.json", message: "Could not login")
    end
  end
end
