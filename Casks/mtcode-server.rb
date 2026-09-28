cask "mtcode-server" do
  version "1.0.0"
  sha256 "6dd978e4521b8e6c457381c5488d2a4d59746d7244eedac34ff459e2be197494"

  url "https://mtcodeai.com/downloads/mtcode-server/MTCodeServer-macOS-Universal.dmg"
  name "MTCode Server"
  desc "Server host for MTCode AI GPU services"
  homepage "https://mtcodeai.com/"

  # Universal dmg (arm64 + x86_64): no arch restriction.

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
