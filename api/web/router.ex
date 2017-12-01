defmodule Slek.Router do
  use Slek.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
    plug Guardian.Plug.VerifyHeader, realm: "Bearer"
    plug Guardian.Plug.LoadResource
  end

  scope "/" do
    pipe_through :browser

    get "/", PageController, :index
  end

  scope "/api", Slek do
    pipe_through :api

    post "/sessions", SessionController, :create
    delete "/sessions", SessionConroller, :delete
    post "/sessions/refresh", SessionController, :refresh
    resources "/users", UserController, only: [:create]
  end

  scope "/api", Slek do
    pipe_through :api
  end
end
