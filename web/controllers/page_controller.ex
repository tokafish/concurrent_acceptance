defmodule ConcurrentAcceptance.PageController do
  use ConcurrentAcceptance.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
