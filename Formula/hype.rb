class Hype < Formula
  desc "CLI for Hype Doc: log and track your wins from the terminal"
  homepage "https://github.com/myhypedoc/cli"
  version "1.0.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/myhypedoc/cli/releases/download/v#{version}/hype-darwin-arm64"
      sha256 "afb13e1756836647c5014c737296fb85bca3287f8affac327479ed05dd80468a"
    else
      url "https://github.com/myhypedoc/cli/releases/download/v#{version}/hype-darwin-x64"
      sha256 ""
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/myhypedoc/cli/releases/download/v#{version}/hype-linux-arm64"
      sha256 "105f014ca28f94f58cd6ea1ec2d783aedcbe873486e2a8b8ffb9dd5c7d20984f"
    else
      url "https://github.com/myhypedoc/cli/releases/download/v#{version}/hype-linux-x64"
      sha256 "37aa3c4a6cb95b831c719fa1769bb06cfbba3d3d67de5b79abb9e07dc922a138"
    end
  end

  def install
    binary_name = stable.url.split("/").last
    bin.install binary_name => "hype"
  end

  test do
    assert_match "Hype Doc CLI", shell_output("#{bin}/hype --help")
  end
end
