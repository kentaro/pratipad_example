defmodule Pratipad.Example.Application do
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      {Pratipad, nil}
    ]

    opts = [strategy: :one_for_one, name: Pratipad.Example.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
