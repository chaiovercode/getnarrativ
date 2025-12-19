cask "narrativ" do
  version "1.0.5"
  sha256 "df66798a41493faf47ce00d5952d9f32ec65d2892a6d1f4b58d932a9e7323c09"

  url "https://github.com/chaiovercode/getnarrativ/releases/download/v#{version}/Narrativ_#{version}_aarch64.dmg"
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
