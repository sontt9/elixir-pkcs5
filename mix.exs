defmodule Pkcs5.Mixfile do
  use Mix.Project

  def project do
    [app: :pkcs5,
     version: "1.0.0",
     elixir: "~> 1.4",
     description: "PKCS5 binary padding for erlang",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     # package: package,
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    # Specify extra applications you'll use from Erlang/Elixir
    [extra_applications: [:logger]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:my_dep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:my_dep, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
  #
  # To depend on another app inside the umbrella:
  #
  #   {:my_app, in_umbrella: true}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    []
  end

  # defp package do
  #   [files: ["lib", "src", "mix.exs", "README*"],
  #    contributors: ["Vuong Thang"],
  #    licenses: ["MIT"],
  #    links: %{"GitHub" => "https://github.com/sonttt9/pkcs5.git"}]
  # end
end
