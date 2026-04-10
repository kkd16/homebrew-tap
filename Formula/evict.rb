class Evict < Formula
  desc "Kill whatever process is using a given port."
  homepage "https://github.com/kkd16/evict"
  version "1.0.0"
  license "MIT"

  on_macos do
    url "https://github.com/kkd16/evict/releases/download/v1.0.0/evict-macos-arm"
    sha256 "fa0700f8817b6aff8f3b9e5aaae9099884e74f8bc0813555de4182369ab88bc1"
  end

  on_linux do
    url "https://github.com/kkd16/evict/releases/download/v1.0.0/evict-linux-amd64"
    sha256 "8cce6d94de8035c2ed56cbb55af60f50e24b714f35ab7da4c68796017958d2f0"
  end

  def install
    binary = Dir["evict-*"].first || "evict"
    mv binary, "evict"
    bin.install "evict"
  end

  test do
    assert_match "evict", shell_output("#{bin}/evict 2>&1", 1)
  end
end
