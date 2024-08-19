defmodule ThemeToggle.MixProject do
  use Mix.Project

  @version "0.1.0"
  @source_url "https://github.com/trance128/theme_toggle"

  def project do
    [
      app: :theme_toggle,
      version: @version,
      elixir: "~> 1.17",
      description: "Theme toggle inspired by shadcn/ui",
      package: package(),
      deps: deps(),
      name: "Theme Toggle",
      source_url: @source_url,
      docs: docs(),
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
    ]
  end

  defp package do
    [
      files: ~w(lib assets mix.exs README.md LICENSE*),
      maintainers: ["Ovidius Mazuru"],
      licenses: ["MIT"],
      links: %{"GitHub" => @source_url}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:phoenix, ">= 1.4.0"},
      {:phoenix_live_view, ">= 0.18.0"}
    ]
  end

  defp docs do
    [
      main: "readme",
      extras: ["README.md"],
      source_url: @source_url
    ]
  end
end
