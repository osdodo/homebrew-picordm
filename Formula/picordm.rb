class Picordm < Formula
  desc "Lightweight Redis terminal management tool built with Rust and Ratatui"
  homepage "https://github.com/osdodo/picordm"
  version "0.5.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/osdodo/picordm/releases/download/v0.5.2/picordm-v0.5.2-macos-aarch64.tar.gz"
      sha256 "26a72c58b7893a69b56de9d4afdd2cd55763428a3c61680a58a419aea4777511"
    else
      url "https://github.com/osdodo/picordm/releases/download/v0.5.2/picordm-v0.5.2-macos-x86_64.tar.gz"
      sha256 "83acb67fb2bcfe41635dbbf3158a583ea7761ddedadb96f986159296a925c081"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/osdodo/picordm/releases/download/v0.5.2/picordm-v0.5.2-linux-arm64.tar.gz"
      sha256 "33f806a3aabadc7b06d69d3e0c168f1e3e08befc5f9cd8b07a3112add328b874"
    else
      url "https://github.com/osdodo/picordm/releases/download/v0.5.2/picordm-v0.5.2-linux-x86_64.tar.gz"
      sha256 "c415d0ad7a31d5a8837fb668a82598243dd0491094f14db59af3f4fa15003538"
    end
  end

  def install
    bin.install "picordm"
  end

  test do
    assert_match "picordm", shell_output("#{bin}/picordm --version")
  end
end
