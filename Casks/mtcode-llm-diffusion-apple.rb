# Homebrew cask for the MTCode LLM & Diffusion Apple Metal backend.
#
# How to publish (one-time setup):
#   1. Copy this file into the existing tap repo github.com/mtcodeai/homebrew-tap
#      as:  Casks/mtcode-llm-diffusion-apple.rb
#      (build_deploy_mac.sh does this automatically when
#      ~/.config/mtcodeai/github_token exists.)
#   2. Users then install with:
#        brew tap mtcodeai/tap
#        brew install --cask mtcode-llm-diffusion-apple
#      Homebrew mounts the dmg and runs install.sh, which copies the backend
#      into the per-user MTCode Server data directory — no sudo.
#
# Per release: update `version` and `sha256` below and push to the tap.
#   sha256:  shasum -a 256 MTCodeLLMDiffusion-Apple-macOS-ARM64.dmg
# Tip: publish the dmg under a versioned name (referenced as #{version}
# in `url`) so cached downloads can never go stale under an unchanged URL.

cask "mtcode-llm-diffusion-apple" do
  version "1.0.0"
  sha256 "e2fd67188ec4ac8165a4e8799618469fae16a267b7e32a11198a51eb8370d0ab"

  url "https://mtcodeai.com/downloads/mtcode-llm-diffusion/MTCodeLLMDiffusion-Apple-macOS-ARM64.dmg"
  name "MTCode LLM and Diffusion Apple Metal Backend"
  desc "Apple Metal LLM and diffusion backend for MTCode Server"
  homepage "https://mtcodeai.com/"

  depends_on arch: :arm64
  depends_on cask: "mtcode-server"

  installer script: {
    executable: "install.sh",
  }

  uninstall script: {
    executable: "uninstall.sh",
  }

  zap trash: [
    "~/Library/Application Support/MTCodeServer/llm-diffusion",
  ]

  caveats <<~EOS
    The backend installs into:
      ~/Library/Application Support/MTCodeServer/llm-diffusion/apple
    Start or restart MTCode Server afterwards so it detects the backend.
  EOS
end
