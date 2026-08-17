# Homebrew cask for MTCode Server (GUI + mtserver-cli).
#
# How to publish (one-time setup):
#   1. Copy this file into the existing tap repo github.com/mtcodeai/homebrew-tap
#      as:  Casks/mtcode-server.rb
#   2. Users then install with:
#        brew tap mtcodeai/tap
#        brew install --cask mtcode-server
#      Homebrew copies the app to /Applications and symlinks mtserver-cli,
#      mtcode-admin and mtcode-relay into its bin directory (already on
#      PATH) — no sudo, no extra steps.
#
# Per release: update `version` and `sha256` below and push to the tap.
#   sha256:  shasum -a 256 MTCodeServer-macOS-ARM64.dmg
# Tip: publish the dmg under a versioned name (e.g.
# MTCodeServer-1.0.1-macOS-ARM64.dmg, referenced as #{version} in `url`) so
# cached downloads can never go stale under an unchanged URL.
#
# Note on Gatekeeper: Homebrew itself requires no signature, but the app it
# installs is quarantined like any download — an unsigned/un-notarized build
# shows the "unverified developer" prompt on first launch. Sign + notarize
# the release dmg to remove that friction (users can also opt out with
# `brew install --cask --no-quarantine mtcode-server`).

cask "mtcode-server" do
  version "1.0.0"
  sha256 "2f0f933cb304b0a86bb6a6723a6143a14ba42ef50fe6d268b9b0eb633b5dd062"

  url "https://mtcodeai.com/downloads/mtcode-server/MTCodeServer-macOS-ARM64.dmg"
  name "MTCode Server"
  desc "Server host for MTCode AI GPU services"
  homepage "https://mtcodeai.com/"

  depends_on arch: :arm64

  app "MTCodeServer.app"
  binary "#{appdir}/MTCodeServer.app/Contents/MacOS/mtserver-cli"
  binary "#{appdir}/MTCodeServer.app/Contents/MacOS/mtcode-admin"
  binary "#{appdir}/MTCodeServer.app/Contents/MacOS/mtcode-relay"

  zap trash: [
    "~/Library/Application Support/MTCodeServer",
  ]

  caveats <<~EOS
    By installing or using MTCode Server you agree to the license terms:
      #{appdir}/MTCodeServer.app/Contents/Resources/LICENSE.txt
    Third-party notices:
      #{appdir}/MTCodeServer.app/Contents/Resources/third-party-licenses.txt
  EOS
end
