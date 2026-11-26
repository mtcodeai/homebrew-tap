cask "mtcode-portal" do
  version "1.0.1"
  sha256 "aef5cced72e5469cab82a1638ed37c5b9a5a4f536d4f80009dc9b8245222e49f"

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
