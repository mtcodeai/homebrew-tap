# Homebrew cask for the MTCode Apple Metal backend (mtcode-llm + mtcode-diffusion).
#
# How to publish (one-time setup):
#   1. Copy this file into the existing tap repo github.com/mtcodeai/homebrew-tap
#      as:  Casks/mtcode-llm-diffusion-apple.rb
#      (build_deploy_mac.sh does this automatically when a GitHub token is
#      available at ~/.config/mtcodeai/github_token.)
#   2. Users then install with:
#        brew tap mtcodeai/tap
#        brew install --cask mtcode-llm-diffusion-apple
#
# Per release: build_deploy_mac.sh rewrites `version` and `sha256` below from
# the freshly built dmg, then pushes the file to the tap. The sha256 is the
# dmg's:  shasum -a 256 MTCodeLLMDiffusion-Apple-macOS-ARM64.dmg
#
# The dmg carries install.sh / uninstall.sh, which place the backend in
# ~/Library/Application Support/MTCodeServer/llm-diffusion/apple (per-user,
# no sudo) and register it with MTCode Server — the same flow as running the
# "Install MTCode Backend.command" from the mounted dmg.

cask "mtcode-llm-diffusion-apple" do
  version "1.0.0"
  sha256 "12697eff8b7fa51a35a02860c673b918aa12869cef7d344cb95cb59dbf58758e"

  url "https://mtcodeai.com/downloads/mtcode-llm-diffusion/MTCodeLLMDiffusion-Apple-macOS-ARM64.dmg"
  name "MTCode LLM-Diffusion Apple Backend"
  desc "Apple Metal LLM and diffusion backend for MTCode Server"
  homepage "https://mtcodeai.com/"

  depends_on arch: :arm64

  installer script: {
    executable: "install.sh",
  }

  uninstall script: {
    executable: "uninstall.sh",
  }

  zap trash: [
    "~/Library/Application Support/MTCodeServer/llm-diffusion/apple",
  ]
end
