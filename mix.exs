defmodule Pkcs5.Mixfile do
  use Mix.Project

  def project do
    [
      app: :pkcs5,
      version: "1.0.0",
      elixir: "~> 1.4",
      description: "PKCS5 binary padding for erlang",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      package: package,
      deps: deps
    ]
  end

  def application do
    [extra_applications: [:logger]]
  end

  defp deps do
    []
  end

  defp package do
    [
      name: "PKCS5",
      files: ["lib", "src", "mix.exs", "readme*"],
      maintainers: ["Son Thai", "Vuong Thang"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/sonttt9/pkcs5.git"}
    ]
  end
end
