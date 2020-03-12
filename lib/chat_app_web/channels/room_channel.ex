defmodule ChatAppWeb.RoomChannel do
  use Phoenix.Channel

  require Logger
  require DateTime

  alias ChatApp.Messages

  def join("room:lobby", _message, socket) do
    {:ok, socket}
  end

  def join("room:" <> _private_room_id, _params, _socket) do
    {:error, %{reason: "authorized"}}
  end

  def handle_in("new_msg", %{"body" => body}, socket) do
    pd = socket.assigns.peer_data
    addr =
      pd.address
      |> Tuple.to_list
      |> Enum.join(".")
    host = "#{addr}:#{pd.port}"
    now = DateTime.utc_now

    with {:ok, _} <- Messages.create_message(%{message: body, host: host, posted_at: now}) do
      broadcast!(socket, "new_msg", %{body: body, date: now})
    end

    {:noreply, socket}
  end
end
