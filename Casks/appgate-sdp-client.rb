cask 'appgate-sdp-client' do
  version '5.0.1'
  sha256 'c00c7d19f8d70bf340b0e74c1a03ffda625f2bbd9d8994003c4fd67ffc2161f8'

  # sdpdownloads.cyxtera.com was verified as official when first introduced to the cask
  url "https://sdpdownloads.cyxtera.com/AppGate-SDP-#{version.major_minor}/clients/AppGate-SDP-#{version}-Installer.dmg"
  appcast "https://www.cyxtera.com/essential-defense/appgate-sdp/support/appgate-sdp-v#{version.major}-#{version.minor}"
  name 'AppGate SDP Client for macOS'
  homepage 'https://www.cryptzone.com/downloadcenter/appgate-sdp'

  depends_on macos: '>= :el_capitan'

  pkg 'AppGate SDP Installer.pkg'

  uninstall launchctl: [
                         'com.cyxtera.appgate.sdp.client.agent',
                         'com.cyxtera.appgate.sdp.helper',
                         'com.cyxtera.appgate.sdp.tun',
                         'com.cyxtera.appgate.sdp.updater',
                       ],
            quit:      [
                         'com.cyxtera.appgate.helper',
                         'com.cyxtera.appgate.sdp',
                       ],
            signal:    [
                         ['QUIT', 'com.cyxtera.appgate'],
                       ],
            pkgutil:   'com.appgate.pkg.appgatetun.component'

  zap trash: [
               '~/Library/Application Support/appgate-ui',
               '~/Library/Caches/com.cyxtera.appgate.sdp.uninstall',
               '~/Library/Preferences/com.cyxtera.appgate.sdp*',
               '~/Library/Saved Application State/com.cyxtera.appgate.sdp.savedState',
             ]
end
