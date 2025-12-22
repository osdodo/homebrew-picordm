class Picordm < Formula
  desc "Lightweight Redis terminal management tool built with Rust and Ratatui"
  homepage "https://github.com/osdodo/picordm"
  version "0.4.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/osdodo/picordm/releases/download/v0.4.1/picordm-v0.4.1-macos-aarch64.tar.gz"
      sha256 "eef5dc9b196f5f5b711c4dc433be50fa0ca7d56555b38a26fdfdbae11db79955"
    else
      url "https://github.com/osdodo/picordm/releases/download/v0.4.1/picordm-v0.4.1-macos-x86_64.tar.gz"
      sha256 "d460b238f448d817b1f264c88ee28916760f190a7ef3e32dc7f240de93bd87e7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/osdodo/picordm/releases/download/v0.4.1/picordm-v0.4.1-linux-arm64.tar.gz"
      sha256 "59345d16982aeb5101b933b4c7b229b8af207055a4e48edaa1e2b751f87416ac"
    else
      url "https://github.com/osdodo/picordm/releases/download/v0.4.1/picordm-v0.4.1-linux-x86_64.tar.gz"
      sha256 "2a32a2c519d090ee68bd4542f6e2fff0b1b87f2088c9ca5db5abfd34c4481416"
    end
  end

  def install
    bin.install "picordm"
  end

  test do
    assert_match "picordm", shell_output("#{bin}/picordm --version")
  end
end
