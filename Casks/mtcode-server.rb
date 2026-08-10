cask "mtcode-server" do
  version "1.0.1"
  sha256 "c4ad55a7b05d6999bda71143e0e3eb5bbdad3dc35a00398860b9f4d5c82c43db"

  url "https://mtcodeai.com/downloads/mtcode-server/MTCodeServer-macOS-ARM64.dmg"
  name "MTCode Server"
  desc "Server host for MTCode AI GPU services"
  homepage "https://mtcodeai.com/"

  depends_on arch: :arm64

  app "MTCodeServer.app"
  binary "#{appdir}/MTCodeServer.app/Contents/MacOS/mtserver-cli"

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
