class Hype < Formula
  desc "CLI for Hype Doc: log and track your wins from the terminal"
  homepage "https://github.com/myhypedoc/cli"
  version "1.0.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/myhypedoc/cli/releases/download/v#{version}/hype-darwin-arm64"
      sha256 "66af61b92f1c216438de67f4f2169184e2b4566f8e6282da98b0795482286423"
    else
      url "https://github.com/myhypedoc/cli/releases/download/v#{version}/hype-darwin-x64"
      sha256 ""
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/myhypedoc/cli/releases/download/v#{version}/hype-linux-arm64"
      sha256 "13dff3a1c0cd898b388ed0e24cf620fa8e1a52f86b87bf0e48bb81cc5dd63030"
    else
      url "https://github.com/myhypedoc/cli/releases/download/v#{version}/hype-linux-x64"
      sha256 "d5a3324f45923eb0c276faffb7edad947eee749699d935fd667347647ef9d893"
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
