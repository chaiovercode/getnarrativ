cask "narrativ" do
  version "1.0.5"
  sha256 "3b5237efa1489ab2fa5762dc4c974c36e17e7e5a047ce76f4ac6f98249c1e2d5"

  url "https://github.com/chaiovercode/homebrew-getnarrativ/releases/download/v#{version}/Narrativ_#{version}_aarch64.dmg"
  name "Narrativ"
  desc "AI-powered visual storytelling app"
  homepage "https://chaiovercode.com/narrativ"

  depends_on arch: :arm64
  depends_on macos: ">= :monterey"

  app "Narrativ.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Narrativ.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/com.narrativ.app",
    "~/Library/Caches/com.narrativ.app",
    "~/Library/Preferences/com.narrativ.app.plist",
  ]
end
