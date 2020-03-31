defmodule Phx13Gdn10.Guardian do
  use Guardian, otp_app: :phx13_gdn10

  alias Phx13Gdn10.Repo
  alias Phx13Gdn10.Users.User

  def subject_for_token(resource, _claims) do
    {:ok, to_string(resource.id)}
    #tokenをdecodeすると、tokenの文字列の一部としてsub=xxxとidが表示される。
    #resource_from_claimsの中でclaims["sub"]としてidが取り出されている。
  end

  def resource_from_claims(claims) do
    id = claims["sub"]
    resource = Repo.get(User, id)
    {:ok, resource}
  end
end
