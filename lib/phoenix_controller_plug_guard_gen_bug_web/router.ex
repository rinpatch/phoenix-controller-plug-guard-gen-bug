defmodule PhoenixControllerPlugGuardGenBugWeb.Router do
  use PhoenixControllerPlugGuardGenBugWeb, :router

  scope "/", PhoenixControllerPlugGuardGenBugWeb do
    get "/", PageController, :index
    get "/tenko", PageController, :tenko
    get "/cofe", PageController, :cofe
  end
end
