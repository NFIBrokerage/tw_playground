defmodule TwPlaygroundWeb.UserLive.ButtonComponent do
  use TwPlaygroundWeb, :live_component

  alias TwPlayground.Accounts

  def update(assigns, socket) do
    assigns = Map.put_new(assigns, :class, "text-3xl")
    {:ok, assign(socket, assigns)}
  end

  def render(assigns) do
    ~H"""
    <div>
     <h1 class={@class}phx-click="change-color" phx-target={@myself}>Hello World</h1>
    </div>
    """
  end

  def handle_event("change-color",_payload, socket) do
    {:noreply, assign(socket, :class, "text-3xl text-pink-500")}

  end





end
