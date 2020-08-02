#! /bin/sh

echo "  > Update software for macOS"
sudo softwareupdate -i -a > /dev/null 

echo "  > Apply configuration"
target_dir=$HOME/Library/KeyBindings
mkdir -p $target_dir
cat > $target_dir/DefaultkeyBinding.dict <<- "EOF"
{
    "₩" = ("insertText:", "`");
}
EOF

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

# Ask for the administrator password upfront
sudo -v

# Disable the sound effects on boot
sudo nvram SystemAudioVolume=" "

# SetUp default settings
defaults write NSGlobalDomain AppleAccentColor -int 3
defaults write NSGlobalDomain AppleActionOnDoubleClick -string "Maximize"
defaults write NSGlobalDomain AppleAquaColorVariant -int 1
defaults write NSGlobalDomain AppleHighlightColor -string "0.752941 0.964706 0.678431 Green"
defaults write NSGlobalDomain AppleICUForce24HourTime -int 1
defaults write NSGlobalDomain AppleLanguages -array "en-KR" "ko-KR"
defaults write NSGlobalDomain AppleLocale -string "en_KR"
defaults write NSGlobalDomain AppleMeasurementUnits -string "Centimeters"
defaults write NSGlobalDomain AppleMetricUnits -int 1
defaults write NSGlobalDomain AppleMetricUnits -string "Automatic"
defaults write NSGlobalDomain AppleTemperatureUnit -string "Celsius"
defaults write NSGlobalDomain ContextMenuGesture -int 1
defaults write NSGlobalDomain InitialKeyRepeat -int 15
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticTextCompletionEnabled -bool false
defaults write NSGlobalDomain NSCloseAlwaysConfirmsChanges -bool true
defaults write NSGlobalDomain NSQuitAlwaysKeepsWindows -bool false
defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int 1
defaults write NSGlobalDomain TISRomanSwitchState -int 0
defaults write NSGlobalDomain WebAutomaticSpellingCorrectionEnabled -bool false
defaults write NSGlobalDomain com.apple.trackpad.forceClick -int 0
defaults write NSGlobalDomain com.apple.trackpad.scaling -int 3
defaults write NSGlobalDomain com.apple.dock.autohide -bool true
defaults write NSGlobalDomain com.apple.dock.loc -string "en_US:KR"
defaults write NSGlobalDomain com.apple.dock.magnification -int 1
defaults write NSGlobalDomain com.apple.dock.minimize-to-application -bool true
defaults write NSGlobalDomain com.apple.dock.mru-spaces -bool false
defaults write NSGlobalDomain com.apple.driver.AppleBluetoothMultitouch.trackpad.Clicking -bool true
defaults write NSGlobalDomain com.apple.driver.AppleBluetoothMultitouch.trackpad.HIDScrollZoomModifierMask -int 262144
defaults write NSGlobalDomain com.apple.driver.AppleBluetoothMultitouch.TrackpadThreeFingerHorizSwipeGesture -int 0
defaults write NSGlobalDomain com.apple.driver.AppleBluetoothMultitouch.TrackpadThreeFingerVertSwipeGesture -int 0
defaults write NSGlobalDomain com.apple.driver.AppleBluetoothMultitouch.TrackpadTwoFingerDoubleTapGesture -int 0
defaults write NSGlobalDomain com.apple.driver.AppleBluetoothMultitouch.TrackpadTwoFingerFromRightEdgeSwipeGesture -int 0
defaults write NSGlobalDomain com.apple.loginwindow.TALLogoutReason -string "Shut Down"
defaults write NSGlobalDomain com.apple.mediaaccessibility.MACaptionActiveProfile -string "MACaptionProfile-OutlineText"
defaults write NSGlobalDomain com.apple.menuextra.battery.ShowPercent -string "YES"
defaults write NSGlobalDomain com.apple.menuextra.clock.DateFormat -string "H:mm:ss"
defaults write NSGlobalDomain com.apple.menuextra.clock.FlashDateSeparators -int 0
defaults write NSGlobalDomain com.apple.menuextra.clock.IsAnalog -int 0

# Kill affected applications 
for app in "Activity Monitor" \
	"Address Book" \
	"Calendar" \
	"cfprefsd" \
	"Contacts" \
	"Dock" \
	"Finder" \
	"Google Chrome Canary" \
	"Google Chrome" \
	"Mail" \
	"Messages" \
	"Opera" \
	"Photos" \
	"Safari" \
	"SizeUp" \
	"Spectacle" \
	"SystemUIServer" \
	"Terminal" \
	"Transmission" \
	"Tweetbot" \
	"Twitter" \
	"iCal"; do
	killall "${app}" &> /dev/null
done

echo "Done. Note that some of these changes require a logout/restart to take effect."