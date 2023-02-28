defmodule StacApi.Providers do
  alias Finch
  alias Jason

  def get_providers() do
    with {:ok, %Finch.Response{body: raw_body}} <-
           :get
           |> Finch.build(Application.fetch_env!(:stac_api, :providers))
           |> Finch.request(Cmr),
         {:ok, providers} <- Jason.decode(raw_body) do
      providers
    end
  end

  def get_cloud_providers() do
    get_providers()
    |> Task.async_stream(&get_provider_holdings_count(&1))
    |> Enum.reduce([], fn {provider, holdings}, acc ->
      if holdings > 0 do
        [provider | acc]
      else
        acc
      end
    end)
    |> Enum.to_list()
  end

  def get_provider_holdings_count(provider) do
    provider_id = provider |> Map.get("provider-id")

    url =
      Application.fetch_env!(:stac_api, :search) <>
        "/collections?provider_id=#{provider_id}&page_size=0&cloud_hosted=true"

    {:ok, %Finch.Response{headers: headers}} =
      :get
      |> Finch.build(url)
      |> Finch.request(Cmr)

    {holdings_count, _} =
      headers
      |> get_header("cmr-hits")
      |> case do
        {_k, v} -> Integer.parse(v)
        _ -> {0, nil}
      end

    {provider, holdings_count}
  end

  defp get_header(headers, header) do
    headers |> Enum.find(fn {k, _v} -> k === header end)
  end
end
