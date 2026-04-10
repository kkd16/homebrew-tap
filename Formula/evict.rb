class Evict < Formula
  desc "Kill whatever process is using a given port"
  homepage "https://github.com/kkd16/evict"
  version "3.0.0"
  license "MIT"

  if OS.mac?
    url "https://github.com/kkd16/evict/releases/download/v#{version}/evict-macos-arm"
    sha256 "92bb9402e1ab16da09de3317c78c1cd6de9d8ada29d2d81f637f0a45a217bbbb"
  elsif OS.linux?
    url "https://github.com/kkd16/evict/releases/download/v#{version}/evict-linux-amd64"
    sha256 "9638e213fb1b162513345ff813bee617ae90be42545c1bc9a0c6421d5de48f0d"
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
