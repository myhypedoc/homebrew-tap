class Hype < Formula
  desc "CLI for Hype Doc: log and track your wins from the terminal"
  homepage "https://github.com/myhypedoc/cli"
  version "1.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/myhypedoc/cli/releases/download/v#{version}/hype-darwin-arm64"
      sha256 "4d96d86599c8da8a2b816b2fa1dd6b4ee23419a6ad2e124184319a7edafd67de"
    else
      url "https://github.com/myhypedoc/cli/releases/download/v#{version}/hype-darwin-x64"
      sha256 ""
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/myhypedoc/cli/releases/download/v#{version}/hype-linux-arm64"
      sha256 "ffb61e5755ff2b3ab40296376edaaac917140ffa97ce9834413835cd9910c6bc"
    else
      url "https://github.com/myhypedoc/cli/releases/download/v#{version}/hype-linux-x64"
      sha256 "28656412014c548094b9275852bcc39584f73f1df5a4f9ad0bb582c227437e39"
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
