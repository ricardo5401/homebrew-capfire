# Homebrew formula for the Capfire developer CLI.
#
# This file is a TEMPLATE. To host it in a Homebrew tap:
#
#   1. Create a public repo named `homebrew-capfire` under your GitHub user:
#        https://github.com/ricardo5401/homebrew-capfire
#
#   2. Copy this file into that repo as `Formula/capfire.rb`.
#
#   3. Cut a Capfire release (`git tag v0.1.0 && git push origin v0.1.0`) —
#      the GitHub Actions release workflow publishes the signed tarballs
#      this formula points at.
#
#   4. Compute SHA256 of each tarball (or pull them from `checksums.txt`
#      in the release assets) and update the `sha256` strings below.
#
#   5. Commit + push the formula repo. Users install with:
#
#        brew tap ricardo5401/capfire
#        brew install capfire
#
# When you cut a new release, bump `version` and update the four sha256
# values. A later iteration can automate this with a second GitHub Actions
# workflow that pushes to the tap repo — keep it manual until the release
# cadence is fast enough to justify the extra moving part.

class Capfire < Formula
  desc "JWT-authenticated deploy orchestrator — developer CLI"
  homepage "https://github.com/ricardo5401/capfire"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/ricardo5401/capfire/releases/download/v#{version}/capfire-v#{version}-darwin-amd64.tar.gz"
      sha256 "dc59cc9f81a9a0fa86b99c948fc4a700eb9393357166f9a3b20ba71f4f98a36e"
    end
    on_arm do
      url "https://github.com/ricardo5401/capfire/releases/download/v#{version}/capfire-v#{version}-darwin-arm64.tar.gz"
      sha256 "2b589c787a77a7fd4e8539d4482a4a222a8d9bbb94f6e42429ed34e392df50f9"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ricardo5401/capfire/releases/download/v#{version}/capfire-v#{version}-linux-amd64.tar.gz"
      sha256 "a1981f1fb1edcf7f42bffe1a967b06ea69c96f72c500b54f0382fec879003634"
    end
    on_arm do
      url "https://github.com/ricardo5401/capfire/releases/download/v#{version}/capfire-v#{version}-linux-arm64.tar.gz"
      sha256 "6554733f15528fd737ddd8fe46eabdfec536cb2cc09c862e511472abf2a7b1e4"
    end
  end

  def install
    bin.install "capfire"
  end

  test do
    assert_match "capfire version", shell_output("#{bin}/capfire --version")
  end
end
