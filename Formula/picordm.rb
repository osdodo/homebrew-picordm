class Picordm < Formula
  desc "Lightweight Redis terminal management tool built with Rust and Ratatui"
  homepage "https://github.com/osdodo/picordm"
  version "0.5.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/osdodo/picordm/releases/download/v0.5.1/picordm-v0.5.1-macos-aarch64.tar.gz"
      sha256 "26b043ca7ba170ab79dea5b5d728a5c244bd5184e37917161c04fb05f5aa404d"
    else
      url "https://github.com/osdodo/picordm/releases/download/v0.5.1/picordm-v0.5.1-macos-x86_64.tar.gz"
      sha256 "b0611baae404b9db67b338831c10df3bf7bda8db04052ca56ee899282eb62d8a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/osdodo/picordm/releases/download/v0.5.1/picordm-v0.5.1-linux-arm64.tar.gz"
      sha256 "1e13def98155e1c95874bcabec5b0105b1fec69bae37665dccfc7d584f96e6d0"
    else
      url "https://github.com/osdodo/picordm/releases/download/v0.5.1/picordm-v0.5.1-linux-x86_64.tar.gz"
      sha256 "5c6afcfb0f59e263575b582033ff032c7e1dc38d6a6a8173025c56c3255bb96c"
    end
  end

  def install
    bin.install "picordm"
  end

  test do
    assert_match "picordm", shell_output("#{bin}/picordm --version")
  end
end
