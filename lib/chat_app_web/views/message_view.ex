defmodule ChatAppWeb.MessageView do
  use ChatAppWeb, :view
  alias ChatAppWeb.MessageView

  def render("index.json", %{messages: messages}) do
    %{data: render_many(messages, MessageView, "message.json")}
  end

  def render("show.json", %{message: message}) do
    %{data: render_one(message, MessageView, "message.json")}
  end

  def render("message.json", %{message: message}) do
    %{id: message.id,
      message: message.message,
      host: message.host,
      posted_at: message.posted_at}
  end
end
