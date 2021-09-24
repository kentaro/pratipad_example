defmodule Pratipad.Example.Processor.Precipitation do
  alias Pratipad.Processor
  use Processor

  @default_interval 30 * 60 * 1_000

  @impl GenServer
  def init(opts \\ []) do
    interval = opts[:interval] || @default_interval
    schedule(0)

    {:ok,
     %{
       interval: interval,
       precipitation: nil
     }}
  end

  @impl Processor
  def process(data, state) do
    Map.put(data, :precipitation, retrieve_precipitation(state))
  end

  @impl GenServer
  def handle_info(:retrieve_precipitation, state) do
    precipitation = retrieve_precipitation(%{state | precipitation: nil})
    schedule(state.interval)
    {:noreply, %{state | precipitation: precipitation}}
  end

  defp schedule(interval) do
    Process.send_after(self(), :retrieve_precipitation, interval)
  end

  defp retrieve_precipitation(state) do
    if state.precipitation do
      state.precipitation
    else
      # Thanks to: JJWD - アメダス最新気象データ API サービス https://jjwd.info/index.html
      precipiattion = Json.get("https://jjwd.info", "/api/v2/station/44132")["station"]["preall"]["precip_1h"]
      precipiattion / 1
    end
  end
end
