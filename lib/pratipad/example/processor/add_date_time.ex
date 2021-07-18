defmodule Pratipad.Example.Processor.AddDateTime do
  use Pratipad.Processor

  def process(message) do
    Map.put(message, :datetime, today())
  end

  defp today() do
    dt = DateTime.utc_now()
    "#{dt.year}-#{dt.month}-#{dt.day} #{dt.hour}:#{dt.minute}:#{dt.second}"
  end
end
