defmodule Pratipad.Example.MixProject do
  use Mix.Project

  def project do
    [
      app: :pratipad_example,
      version: "0.1.0",
      elixir: "~> 1.12",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {Pratipad.Example.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:smallex, "~> 0.2.3"},
      {:pratipad, path: "../pratipad", override: true},
      {:off_broadway_otp_distribution, path: "../off_broadway_otp_distribution", override: true}
    ]
  end
end
