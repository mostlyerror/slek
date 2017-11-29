defmodule Slek.Router do
  use Slek.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", Slek do
    pipe_through :api
  end
end
