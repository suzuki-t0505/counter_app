defmodule CounterAppWeb.CounterLive do
  use CounterAppWeb, :live_view

  def render(assigns) do
    ~H"""
    <h1>This count is：<%= @value %></h1>
    <.button type="button" phx-click="dec">-</.button>
    <.button type="button" phx-click="inc">+</.button>
    """
  end

  def mount(_params, _session, socket) do
    {:ok, assign(socket, :value, 0)}
  end

  def handle_event("inc", _params, socket) do
    socket =
      update(socket, :value, fn value ->
        value + 1
      end)

    {:noreply, socket}
  end

  def handle_event("dec", _params, socket) do
    socket =
      update(socket, :value, fn value ->
        value - 1
      end)

    {:noreply, socket}
  end
end
