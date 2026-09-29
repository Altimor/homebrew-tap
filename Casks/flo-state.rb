cask "flo-state" do
  version "0.1.14"
  sha256 "2e84545115cc522b70ca60b0fd847fa2559b7b797a45be0efe0d0e93e1fb4b09"

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
