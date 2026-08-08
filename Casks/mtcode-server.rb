cask "mtcode-server" do
  version "1.0.0"
  sha256 "d8e20c654b1f9336faeadcbc81e0d79a07fb3d592bf2baef52d39e52cc2f8dc6"

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
