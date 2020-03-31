defmodule Phx13Gdn10.Guardian.AuthPipeline do
  @claims %{typ: "access"}

  use Guardian.Plug.Pipeline, otp_app: :Phx13Gdn10,
                                module: Phx13Gdn10.Guardian,
                                error_handler: Phx13Gdn10.Guardian.AuthErrorHandler

  plug Guardian.Plug.VerifySession, claims: @claims
  plug Guardian.Plug.VerifyHeader, claims: @claims, realm: "Bearer"
  plug Guardian.Plug.EnsureAuthenticated
  plug Guardian.Plug.LoadResource, ensure: true
end

defmodule Phx13Gdn10.Guardian.AuthErrorHandler do
  import Plug.Conn

  def auth_error(conn, {type, reason}, _opts) do
    body = Poison.encode!(%{message: to_string(type)})
    send_resp(conn, 401, body)
  end
end
