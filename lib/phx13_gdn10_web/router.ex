defmodule Phx13Gdn10Web.Router do
  use Phx13Gdn10Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :authenticated do
    plug Phx13Gdn10.Guardian.AuthPipeline
  end

  scope "/", Phx13Gdn10Web do
    pipe_through :browser

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
 scope "/api/v1", Phx13Gdn10Web do
   pipe_through :api
   post "/sign_in", SessionController, :sign_in

   pipe_through :authenticated
   resources "/users", UserController, except: [:new, :edit]
 end
end
