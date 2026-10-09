cask "flo-state" do
  version "0.1.18"
  sha256 "b7840e879c180bad0356a6a2cb3de683f583ca919aed6932f9162ace5c70ae66"

  url "https://github.com/Altimor/flo-state/releases/download/v#{version}/FloState-#{version}.zip"
  name "Flo State"
  desc "Minimalist markdown editor"
  homepage "https://flocrivello.com/flostate/"

  auto_updates true
  depends_on macos: :sonoma

  app "Flo State.app"

  # Not notarized yet: drop the quarantine flag so Gatekeeper doesn't block the first launch.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Flo State.app"], must_succeed: false
  end

  zap trash: [
    "~/Library/Application Support/FloStateNative",
    "~/Library/Caches/app.flostate.native",
    "~/Library/HTTPStorages/app.flostate.native",
    "~/Library/Preferences/app.flostate.native.plist",
    "~/Library/Saved Application State/app.flostate.native.savedState",
  ]
end
