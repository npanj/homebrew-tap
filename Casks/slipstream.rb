cask "slipstream" do
  version "26.10.6"
  sha256 "0edc03cbd9b32d9687488fb2591c39d9b13c13d9a487d790c9e3346c7c2cb9e3"

  url "https://github.com/npanj/slipstream-menubar/releases/download/v#{version}/Slipstream-Menubar.#{version}.dmg"
  name "Slipstream"
  desc "Slipstream Menubar app and local inference engine"
  homepage "https://github.com/npanj/slipstream"

  depends_on arch: :arm64
  depends_on macos: :sequoia
  depends_on formula: "npanj/tap/slipstream"

  app "Slipstream Menubar.app"

  zap trash: [
    "~/Library/Application Support/Slipstream",
    "~/Library/Application Support/Slipstream-v2",
    "~/Library/Logs/Slipstream",
    "~/Library/Preferences/local.slipstream.menubar.plist",
  ]
end
