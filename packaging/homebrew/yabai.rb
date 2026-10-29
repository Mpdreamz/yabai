# TEMPLATE: scripts/bump-tap.sh fills in __VERSION__ and __SHA256__ and writes the result to
# mpdreamz/homebrew-tap as Casks/yabai.rb.
cask "yabai" do
  version "__VERSION__"
  sha256 "__SHA256__"

  url "https://github.com/mpdreamz/yabai/releases/download/v#{version}/yabai-#{version}.zip"
  name "yabai"
  desc "Tiling window manager for macOS, with macOS 27 support for the scripting addition"
  homepage "https://github.com/mpdreamz/yabai"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64

  binary "yabai-#{version}/bin/yabai"
  manpage "yabai-#{version}/doc/yabai.1"

  caveats <<~EOS
    This is asmvik/yabai with the macOS 27 fixes from the upstream issues applied
    (see https://github.com/mpdreamz/yabai). It replaces the asmvik/formulae/yabai formula:
    uninstall that first, then (re)write the sudoers rule for --load-sa, since the binary changed.
  EOS
end
