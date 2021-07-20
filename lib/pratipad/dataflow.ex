defmodule Pratipad.Example.Dataflow do
  use Pratipad.Dataflow
  alias Pratipad.Dataflow.{Input, Output}
  alias Pratipad.Example.Processor.Precipitation

  def declare() do
    Input <~> Precipitation <~> Output
  end
end
