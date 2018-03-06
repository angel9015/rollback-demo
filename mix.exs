defmodule TickTickBoom.Mixfile do
  use Mix.Project

  def project do
    [
      app: :tick_tick_boom,
      version: "0.0.1",
      elixir: "~> 1.5",
      build_path: "_build",
      config_path: "config/config.exs",
      deps_path: "deps",
      lockfile: "mix.lock",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      elixirc_paths: code(Mix.env())
    ]
  end

  def application, do: application(Mix.env())

  def application(_) do
    [
      extra_applications: [
        :logger,
        :cowboy,
        :poison,
        :plug,
        :rollbax
      ],
      mod: {TickTickBoom, []}
    ]
  end

  defp deps do
    [
      {:cowboy, "~> 1.1"},
      {:poison, "~> 3.0"},
      {:plug, "~> 1.4"},
      {:rollbax, "~> 0.9"},
    ]
  end

  defp code(:test) do
    ["lib", "test/support"]
  end

  defp code(_) do
    ["lib"]
  end
end
