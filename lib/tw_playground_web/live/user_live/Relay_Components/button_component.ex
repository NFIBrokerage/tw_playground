defmodule TwPlaygroundWeb.UserLive.ButtonComponent do
  use TwPlaygroundWeb, :live_component

  alias TwPlayground.Accounts


  def update(assigns, socket) do
    style = button_styling(@type)
    IO.puts(style)
    assigns = Map.put_new(assigns, :class, style )
    {:ok, assign(socket, assigns)}
  end

  def render(assigns) do
    ~H"""

     <button class={@class}phx-click="change-color" phx-target={@myself}><%= button_styling(@type) %></button>

    """
  end

  def handle_event("change-color",_payload, socket) do
    {:noreply, assign(socket, :class, "border-transparent text-black bg-primary-600 active:bg-primary-700 hover:bg-primary-700 focus:bg-primary-700 active:bg-primary-800 focus:shadow-outline-primary text-sm leading-5 px-4 py-2 font-medium rounded-md inline-flex items-center justify-center border focus:outline-none transition duration-150 ease-in-out")}

  end

  def button_styling (type) do
    IO.puts(type)
    if (type = "primary") do
      "phx-submit-loading:opacity-75 rounded-lg bg-zinc-900 hover:bg-zinc-700 py-2 px-3 text-sm font-semibold leading-6 text-white active:text-white/80 "

    # case type  do
    #  "primary" -> "phx-submit-loading:opacity-75 rounded-lg bg-zinc-900 hover:bg-zinc-700 py-2 px-3 text-sm font-semibold leading-6 text-white active:text-white/80 "


    #   "secondary" -> "text-black"

    #   "success" -> "text-success"

    #   "danger" -> "text-danger"

    #   _ -> "no match found"
    end
  end
end
