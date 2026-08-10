cask "mtcode-server" do
  version "1.0.1"
  sha256 "5cadb21729af07dc86f488ecbf49182c798c592705b5c1b1b244e000058a602c"

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
