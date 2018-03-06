defmodule TickTickBoom.Server do
  require Logger

  def start_link(router) do
    Logger.info("Running Cowboy at #{http_options()[:port]}")
    {:ok, _pid} = Plug.Adapters.Cowboy.http(router, [], http_options())
  end

  defp http_options do
    [
      port: String.to_integer(System.get_env("PORT") || "4001"),
      protocol_options: [
        onresponse: &on_response/4
      ]
    ]
  end

  defp on_response(500, headers, body, request) do
    Logger.error(
      "500 from cowboy",
      body: body,
      headers: headers,
      request: request
    )
  end

  defp on_response(_code, _headers, _, request) do
    request
  end
end
