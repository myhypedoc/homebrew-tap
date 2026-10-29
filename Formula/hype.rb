class Hype < Formula
  desc "CLI for Hype Doc: log and track your wins from the terminal"
  homepage "https://docs.myhypedoc.com/cli/"
  version "2.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/myhypedoc/cli/releases/download/v#{version}/hype-aarch64-apple-darwin.tar.gz"
      sha256 "19c0d932e001df0ca3d4b78ea947c28fdf47b0d501c30aedeee6985c678342bf"
    else
      url "https://github.com/myhypedoc/cli/releases/download/v#{version}/hype-x86_64-apple-darwin.tar.gz"
      sha256 "b430be29ab2addde1b3c5955362518196307e4359c0ada5c70e89f119aad5100"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/myhypedoc/cli/releases/download/v#{version}/hype-aarch64-unknown-linux-musl.tar.gz"
      sha256 "0fd1aa760c975dc417802df71f71f8d89c62e6edb2b7ad9c20f1fa14fc94cadd"
    else
      url "https://github.com/myhypedoc/cli/releases/download/v#{version}/hype-x86_64-unknown-linux-musl.tar.gz"
      sha256 "2a9f2fd26ecd2fa1b89534d0d1c58577b60898cdcfa0f9b1443af5c657b039c9"
    end
  end

  def install
    bin.install "hype"
    generate_completions_from_executable(bin/"hype", "completions", shells: [:bash, :zsh, :fish])
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/hype --version").strip
    assert_match "Hype Doc CLI", shell_output("#{bin}/hype --help")
  end
end
