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
  version "0.1.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/ricardo5401/capfire/releases/download/v#{version}/capfire-v#{version}-darwin-amd64.tar.gz"
      sha256 "09eacde488af9149fc4c65e19f20fbb9a06986d10fd809e2a04c1c6fc82079dd"
    end
    on_arm do
      url "https://github.com/ricardo5401/capfire/releases/download/v#{version}/capfire-v#{version}-darwin-arm64.tar.gz"
      sha256 "fcd7103f9f2a3cdba99b62add1e58910c8964a76d4aaaa2c147b15b7c581092f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ricardo5401/capfire/releases/download/v#{version}/capfire-v#{version}-linux-amd64.tar.gz"
      sha256 "ba0a5f389add9b963ae53daa151c3ac807896c031b8d95f696ec5e390e9f9ca5"
    end
    on_arm do
      url "https://github.com/ricardo5401/capfire/releases/download/v#{version}/capfire-v#{version}-linux-arm64.tar.gz"
      sha256 "36473f066750faeac4c9b530097f73856b7420a548042ce1cad89380bfb63ba8"
    end
  end

  def install
    bin.install "capfire"
  end

  test do
    assert_match "capfire version", shell_output("#{bin}/capfire --version")
  end
end
