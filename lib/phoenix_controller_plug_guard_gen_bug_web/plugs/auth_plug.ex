defmodule PhoenixControllerPlugGuardGenBugWeb.Plugs.AuthPlug do
  import Plug.Conn
  @behaviour Plug

  def init(opts) do
    opts
  end

  def call(conn, opts) do
    param = Keyword.get(opts, :param)
    password = Keyword.get(opts, :password)
    conn = fetch_query_params(conn)

    if conn.query_params[param] == password do
      assign(conn, :authenticated, true)
    else
      assign(conn, :authenticated, false)
    end
  end
end
