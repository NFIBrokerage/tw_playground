defmodule TwPlaygroundWeb.UserLive.ButtonComponent do
  use TwPlaygroundWeb, :live_component

  alias TwPlayground.Accounts


  def update(assigns, socket) do
    assigns = Map.put_new(assigns, :class, button_styling(assigns.type))
    {:ok, assign(socket, assigns)}
  end

  def render(assigns) do
    ~H"""
    <button class={@class} phx-click="change-color" phx-target={@myself}>
      <%= @type %>
    </button>
    """
  end

  def handle_event("change-color", _payload, socket) do
    {:noreply,
     assign(
       socket,
       :class,
       "border-transparent text-black bg-primary-600 active:bg-primary-700 hover:bg-primary-700 focus:bg-primary-700 active:bg-primary-800 focus:shadow-outline-primary text-sm leading-5 px-4 py-2 font-medium rounded-md inline-flex items-center justify-center border focus:outline-none transition duration-150 ease-in-out"
     )}
  end

  defp button_styling(type) do
    case type do
      "primary" -> "text-3xl"
      "secondary" -> "text-xl"
      "success" -> "text-md"
      "danger" -> "text-sm"
      _ -> "no match"
    end
  end
end
