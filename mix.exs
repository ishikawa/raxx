defmodule Raxx.Mixfile do
  use Mix.Project

  def project do
    [app: :raxx,
     version: "0.8.2",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps,
     description: description,
     docs: [extras: ["README.md"], main: "readme"],
     package: package]
  end

  def application do
    [applications: [:logger, :mime]]
  end

  defp deps do
    [
      {:mime, "~> 1.0"},
      {:plug, "~> 1.2.2"}, # DEBT remove; currently used for query strings etc
      {:ex_doc, ">= 0.0.0", only: :dev},
      {:http_status, path: "./http_status"},
    ]
  end

  defp description do
    """
    A Elixir webserver interface.

    1. An interface specification for Elixir webservers and Elixir application.
    2. A set of tools to help develop Raxx-compliant web applications
    """
  end

  defp package do
    [
     maintainers: ["Peter Saxton"],
     licenses: ["Apache 2.0"],
     links: %{"GitHub" => "https://github.com/crowdhailer/raxx"}]
  end
end
