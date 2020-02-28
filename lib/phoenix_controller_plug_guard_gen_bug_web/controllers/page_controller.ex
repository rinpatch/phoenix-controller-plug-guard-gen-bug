defmodule PhoenixControllerPlugGuardGenBugWeb.PageController do
  use PhoenixControllerPlugGuardGenBugWeb, :controller

  alias PhoenixControllerPlugGuardGenBugWeb.Plugs.AuthPlug

  # This works
  #  plug(AuthPlug, [param: "tenko", password: "tenko_secret"] when action == :tenko)
  #  plug(AuthPlug, [param: "cofe", password: "cofe_secret"] when action == :cofe)

  for authenticated_action <- [:tenko, :cofe] do
    @authenticated_action to_string(authenticated_action)
    @password @authenticated_action <> "_secret"

    plug AuthPlug, [password: @password] when action == @authenticated_action
  end

  def index(conn, _params) do
    send_resp(conn, 200, "Hello!")
  end

  def tenko(%{assigns: %{authenticated: authenticated}} = conn, _params) do
    if authenticated do
      redirect(conn,
        external:
          "https://patch.cx/media/a7b2bfd5f3fc8edf453e043c4014115e98dc85e1ed97c1e42398943cc5998840.png"
      )
    else
      send_resp(conn, 404, "Nothing to see here")
    end
  end

  def cofe(%{assigns: %{authenticated: authenticated}} = conn, _params) do
    if authenticated do
      redirect(conn,
        external:
          "https://patch.cx/media/fa82492fa0748bc2eefe2094fe8d307f77729252a4cc8eacd0673271e7c72e64.gif"
      )
    else
      send_resp(conn, 404, "Nothing to see here")
    end
  end
end
