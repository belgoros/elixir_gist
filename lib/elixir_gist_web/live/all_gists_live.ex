defmodule ElixirGistWeb.AllGistsLive do
  alias ElixirGist.Gists
  use ElixirGistWeb, :live_view

  alias ElixirGist.Gists

  def mount(_params, _uri, socket) do
    {:ok, socket}
  end

  def handle_params(_params, _uri, socket) do
    gists = Gists.list_gists()

    socket =
      assign(
        socket,
        gists: gists
      )

    {:noreply, socket}
  end

  def gist(assigns) do
    ~H"""
    <div class="text-sm text-white ">
      <%= @current_user.email %>/<%= @gist.name %>
    </div>
    <div class="text-sm text-white">
      <%= @gist.updated_at %>
    </div>
    <div class="text-sm text-white">
      <%= @gist.description %>
    </div>
    <div class="text-sm text-white">
      <%= @gist.markup_text %>
    </div>
    """
  end
end
