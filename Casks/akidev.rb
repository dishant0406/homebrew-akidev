# The Homebrew cask for the macOS app. The "Release desktop" workflow of dishant0406/konflix-mono
# rewrites `version` and `sha256` here after it publishes a release. Install with:
#   brew install --cask dishant0406/akidev/akidev
cask "akidev" do
  version "0.1.19"
  sha256 "7477eaf52b078167a1d8c6ded7ff2f281598963ca077a3f11281e6884eefd0c7"

  url "https://github.com/dishant0406/konflix-mono/releases/download/desktop-mac-v#{version}/Akidev-#{version}-arm64.dmg"
  name "Akidev"
  desc "Browse and stream anime, series and films"
  homepage "https://akidev.live/"

  livecheck do
    url "https://github.com/dishant0406/konflix-mono/releases"
    regex(/desktop-mac-v(\d+(?:\.\d+)+)/i)
    strategy :page_match
  end

  # The app updates itself, so brew does not need to.
  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :monterey

  app "Akidev.app"

  zap trash: [
    "~/Library/Application Support/live.akidev.Akidev",
    "~/Library/Caches/live.akidev.Akidev",
  ]
end
