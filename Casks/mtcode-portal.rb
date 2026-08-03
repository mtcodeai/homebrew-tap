cask "mtcode-portal" do
  version "1.0.0"
  sha256 "5c8d72f3ca574208f78ae18521b2c2247c1ad63f7bafa523d64278209065f4e1"

  url "https://mtcodeai.com/downloads/mtcode-portal/MTCodePortal-macOS-ARM64.dmg"
  name "MTCode Portal"
  desc "Portal and tunnel for MTCode AI GPU servers"
  homepage "https://mtcodeai.com/"

  depends_on arch: :arm64

  app "MTCodePortal.app"
  binary "#{appdir}/MTCodePortal.app/Contents/MacOS/mtportal-cli"

  zap trash: [
    "~/Library/Application Support/MTCodePortal",
  ]
end
