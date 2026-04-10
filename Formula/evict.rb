class Evict < Formula
  desc "Kill whatever process is using a given port"
  homepage "https://github.com/kkd16/evict"
  version "4.0.0"
  license "MIT"

  if OS.mac?
    url "https://github.com/kkd16/evict/releases/download/v#{version}/evict-macos-arm"
    sha256 "4fedebe61254b839ff19c4f4120711416fa1ec55bfc0a689f1b1708f949d41ac"
  elsif OS.linux?
    url "https://github.com/kkd16/evict/releases/download/v#{version}/evict-linux-amd64"
    sha256 "4a9499f1eaefae1f8501ce6fd03b4459bc8b73bee79e7b279bb14057b9123e73"
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
