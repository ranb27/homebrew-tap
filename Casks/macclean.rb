cask "macclean" do
  version "0.3.0"
  sha256 "964afdc24142c07652d8361fd813c5055cbf297a48b347b67256969b04d8b09e"

  url "https://github.com/ranb27/macclean/releases/download/v#{version}/macclean-macos-arm64.dmg"
  name "macclean"
  desc "A disk cleaner that can't hurt your Mac — deletes through the Trash, not rm"
  homepage "https://ranb27.github.io/macclean"

  depends_on arch: :arm64
  depends_on macos: :big_sur

  app "macclean.app"

  # Homebrew quarantines every cask since v7 (no opt-out flag). Our own tap
  # can strip it post-install — the app then opens with no warning at all.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/macclean.app"]
  end

  caveats <<~EOS
    macclean is unsigned — the cask removes the quarantine attribute on
    install, so it opens cleanly with no Gatekeeper warning.
  EOS
end
