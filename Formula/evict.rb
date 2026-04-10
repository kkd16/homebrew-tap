class Evict < Formula
  desc "Kill whatever process is using a given port"
  homepage "https://github.com/kkd16/evict"
  license "MIT"

  if OS.mac?
    url "https://github.com/kkd16/evict/releases/download/v5.0.0/evict-macos-arm"
    sha256 "c2ca25386fed5aa654362a89e11166715edcaa0402aeecdd2d848bbe678e45d9"
  elsif OS.linux?
    url "https://github.com/kkd16/evict/releases/download/v5.0.0/evict-linux-amd64"
    sha256 "4cd91115f4460ac90146a490dc9fc77305ef970aff6ff1eb8dd4659cc56a0540"
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
