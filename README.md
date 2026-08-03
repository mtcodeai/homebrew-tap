# MTCode Portal

Desktop client for MTCode DirectLink. It discovers services shared through the
MTCode rendezvous network, establishes direct peer connections to them (NAT
hole punching with QUIC transport), and maps each remote service to a local
port so any local application or browser can use it. The same connections are
also available from the terminal via the bundled `mtportal-cli`.

Runs on Linux, macOS (Apple Silicon), and Windows.

## Features

- **Server list** — live view of the services shared with your account, with
  one-click browser access and a saved default server
- **Local port mapping** — per-service local ports, persisted across runs
- **Account login** — credentials stored in the platform's secure store
  (Keychain / Credential Manager / encrypted file)
- **Access control** — allow or block individual servers or entire accounts
- **Dark mode** — follows the system appearance

## Installation

Download packages and installation instructions:
**https://mtcodeai.com/platform/download.html**

- **Linux** — apt repository, `.deb`, or `.tar.gz`
- **macOS** — `.pkg` installer or `.dmg`, and Homebrew:
  `brew install --cask mtcodeai/tap/mtcode-portal`
- **Windows** — coming soon

Every install provides the **MTCode Portal** GUI and the `mtportal-cli`
terminal client.

## License

Proprietary — see `LICENSE.txt` and `third-party-licenses.txt`.
© 2026 BrightTime Technologies, Inc.
