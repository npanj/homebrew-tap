class Slipstream < Formula
  desc "High-performance Apple Silicon inference for Qwen3.8-Flash-Next and 27B"
  homepage "https://github.com/npanj/slipstream"
  url "https://github.com/npanj/slipstream/releases/download/v26.10.4/slipstream-26.10.4-macos26-arm-64bit.zip"
  sha256 "7b7b60e2aa26544a30cb8f9463f4f0875dcba749ac78eaf9e9488dba56ce0dc8"
  license "Apache-2.0"

  depends_on arch: :arm64
  depends_on macos: :sequoia

  def install
    # The release archive extracts a root directory slipstream-<version>-macos26-arm-64bit/
    root = Dir["slipstream*"].first || "."
    cd root do
      libexec.install Dir["*"]
    end
    bin.install_symlink libexec/"bin/slipstream"
  end

  test do
    assert_match "Slipstream", shell_output("#{bin}/slipstream --help")
  end
end
