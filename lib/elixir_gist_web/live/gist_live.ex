defmodule ElixirGistWeb.GistLive do
  alias ElixirGist.Gists
  use ElixirGistWeb, :live_view

  alias ElixirGist.Gists

  def mount(%{"id" => id}, _session, socket) do
    gist = Gists.get_gist!(id)
    socket = assign(socket, :gist, gist)
    {:ok, socket}
  end
end
