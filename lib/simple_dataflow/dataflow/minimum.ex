defmodule Pratipad.Example.Dataflow.Minimum do
  use Pratipad.Dataflow
  alias Pratipad.Dataflow.{Input, Output}
  alias Pratipad.Example.Processor.AddDateTime

  def declare() do
    Input <~> AddDateTime <~> Output
  end
end
