cask "mtcode-portal" do
  version "1.0.0"
  sha256 "9765be98f545e10a64228cc8992117ee3ba3080f545146cc730bb7dd3defbf3e"

  url "https://mtcodeai.com/downloads/mtcode-portal/MTCodePortal-macOS-Universal.dmg"
  name "MTCode Portal"
  desc "Portal and tunnel for MTCode AI GPU servers"
  homepage "https://mtcodeai.com/"

  # Universal dmg (arm64 + x86_64): no arch restriction.

  app "MTCodePortal.app"
  binary "#{appdir}/MTCodePortal.app/Contents/MacOS/mtportal-cli"
  binary "#{appdir}/MTCodePortal.app/Contents/MacOS/remotegpu-cli"

  zap trash: [
    "~/Library/Application Support/MTCodePortal",
  ]

  caveats <<~EOS
    By installing or using MTCode Portal you agree to the license terms:
      #{appdir}/MTCodePortal.app/Contents/Resources/LICENSE.txt
    Third-party notices:
      #{appdir}/MTCodePortal.app/Contents/Resources/third-party-licenses.txt
  EOS
end
