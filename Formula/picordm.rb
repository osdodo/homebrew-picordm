class Picordm < Formula
  desc "Lightweight Redis terminal management tool built with Rust and Ratatui"
  homepage "https://github.com/osdodo/picordm"
  version "0.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/osdodo/picordm/releases/download/v0.5.0/picordm-v0.5.0-macos-aarch64.tar.gz"
      sha256 "705615f2162a7bdb492c6557f17aa5bb6d32a4ed22e6a8ee4736104d51e1d9f3"
    else
      url "https://github.com/osdodo/picordm/releases/download/v0.5.0/picordm-v0.5.0-macos-x86_64.tar.gz"
      sha256 "b09d516b13cabcf15d989eafbb4d208e151a2604f3f3cd21905c29e3bde1ec3d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/osdodo/picordm/releases/download/v0.5.0/picordm-v0.5.0-linux-arm64.tar.gz"
      sha256 "7755c189b27fbbba8d939fb4f8dc45f54e015fa9a2e8c2dc7c0eda27d665e9f8"
    else
      url "https://github.com/osdodo/picordm/releases/download/v0.5.0/picordm-v0.5.0-linux-x86_64.tar.gz"
      sha256 "47c3b40fda56d22bb26270090a1b54b4ae0789882a4c2ea0c1359bc1deae005c"
    end
  end

  def install
    bin.install "picordm"
  end

  test do
    assert_match "picordm", shell_output("#{bin}/picordm --version")
  end
end
