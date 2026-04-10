class Evict < Formula
  desc "Kill whatever process is using a given port"
  homepage "https://github.com/kkd16/evict"
  version "2.0.0"
  license "MIT"

  on_macos do
    url "https://github.com/kkd16/evict/releases/download/v2.0.0/evict-macos-arm"
    sha256 "65f5b25410176a61d3fdbd832e7a3dbe7e9f034f6d0f584207a7a21b102dfd11"
  end

  on_linux do
    url "https://github.com/kkd16/evict/releases/download/v2.0.0/evict-linux-amd64"
    sha256 "2610f9deec13d7a0556a65fb55cd7b31e3124d4f1b9e649290608608b097b8b8"
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
