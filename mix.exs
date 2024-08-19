defmodule ThemeToggle.MixProject do
  use Mix.Project

  def project do
    [
      app: :theme_toggle,
      version: "0.1.0",
      elixir: "~> 1.17",
      description: "Theme toggle inspired by shadcn/ui",
      package: package(),
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {ThemeToggle.Application, []}
    ]
  end

  defp package do
    [
      files: ~w(lib assets mix.exs README.md LICENSE*),
      maintainers: ["Ovidius Mazuru"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/trance128/theme_toggle"}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:phoenix, "~> 1.7.14"},
      {:phoenix_live_view, ">= 0.18.0"}
    ]
  end
end
