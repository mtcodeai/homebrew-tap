cask "mtcode-server" do
  version "1.0.0"
  sha256 "98443e9fe5961556103b2bc555b3776f38ad2c61c807017bf6bc2ab7a524279a"

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
