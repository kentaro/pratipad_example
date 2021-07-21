defmodule Pratipad.Example.Dataflow do
  use Pratipad.Dataflow
  alias Pratipad.Dataflow.Push
  alias Pratipad.Example.Processor.Precipitation

  def declare() do
    Demand <~> Precipitation <~> Output
  end
end
