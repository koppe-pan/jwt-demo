defmodule Phx13Gdn10Web.PageController do
  use Phx13Gdn10Web, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
