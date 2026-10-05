cask "slipstream" do
  version "26.10.7"
  sha256 "7ebfa02f5000f1995293dc00ca54ac3f5181b20ce334236b0396854c147281cd"

  url "https://github.com/npanj/slipstream-menubar/releases/download/v#{version}/Slipstream.#{version}.dmg"
  name "Slipstream"
  desc "Slipstream macOS app and local inference engine"
  homepage "https://github.com/npanj/slipstream"

  depends_on arch: :arm64
  depends_on macos: :sequoia
  depends_on formula: "npanj/tap/slipstream"

  app "Slipstream.app"

  postflight_steps do
    run "/usr/bin/xattr",
        args:         ["-dr", "com.apple.quarantine", "Slipstream.app"],
        base:         :appdir,
        must_succeed: false
  end

  zap trash: [
    "~/Library/Application Support/Slipstream",
    "~/Library/Application Support/Slipstream-v2",
    "~/Library/Logs/Slipstream",
    "~/Library/Preferences/local.slipstream.menubar.plist",
  ]
end
