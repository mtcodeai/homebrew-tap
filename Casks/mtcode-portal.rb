cask "mtcode-portal" do
  version "1.0.0"
  sha256 "a710ca6bb873254accc841233a0f58fcdd6cacde419dd1067155d5df3eaac87c"

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

  caveats <<~EOS
    By installing or using MTCode Portal you agree to the license terms:
      #{appdir}/MTCodePortal.app/Contents/Resources/LICENSE.txt
    Third-party notices:
      #{appdir}/MTCodePortal.app/Contents/Resources/third-party-licenses.txt
  EOS
end

