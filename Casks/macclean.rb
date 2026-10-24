cask "macclean" do
  version "0.3.1"
  sha256 "8076b50f15d29fc2d8476549ca0e18aa03a9e5f66d59200757fd67400e65b4db"

  url "https://github.com/ranb27/macclean/releases/download/v#{version}/macclean-macos-arm64.dmg"
  name "macclean"
  desc "A disk cleaner that can't hurt your Mac — deletes through the Trash, not rm"
  homepage "https://ranb27.github.io/macclean"

  depends_on arch: :arm64
  depends_on macos: :big_sur

  app "macclean.app"

  caveats <<~EOS
    macclean is unsigned. To skip the Gatekeeper warning entirely:
      brew install --cask macclean --no-quarantine
    Otherwise right-click the app → Open once.
  EOS
end
