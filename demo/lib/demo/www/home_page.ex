defmodule Demo.WWW.HomePage do
  use Raxx.Server
  use Demo.WWW.Layout, arguments: [:title]

  @impl Raxx.Server
  def handle_request(_request = %{method: :GET}, _state) do
    title = "Raxx.Kit"

    response(:ok)
    |> render(title)
  end

  def handle_request(request = %{method: :POST}, _state) do
    case URI.decode_query(request.body) do
      %{"name" => name} ->
        greeting = "Hello, #{name}!"

        response(:ok)
        |> render(greeting)
      _ ->
        response(:bad_request)
        |> render("Bad Request")
    end
  end
end
