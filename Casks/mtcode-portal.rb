cask "mtcode-portal" do
  version "1.0.0"
  sha256 "2df61d1348adc8dc9d6569169663ca7546caa8a31fb3f190229f001048148f97"

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
