cask "flo-state" do
  version "0.1.17"
  sha256 "e199ec0f3f2a90b3f68c640464295b0cd1d7886c5f3cd0dad8516fbf71935e26"

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
