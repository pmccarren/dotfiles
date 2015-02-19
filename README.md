## Installation

    git clone https://github.com/pmccarren/dotfiles.git ~/.dotfiles
    cd ~/.dotfiles
    make

#### Fixup Remote Root Prompt

    echo 'Defaults:%sudo env_keep += "SSH_CLIENT SSH_TTY SSH_CONNECTION"' >> /etc/sudoers

### OS X Yosemite DNS Search Domain Fix
In Yosemite, Apple has moved away from mDNSresponder, to discoveryd. This tweak might look familiar. Many thanks to the guys who answered http://apple.stackexchange.com/a/157017

    Add `--AlwaysAppendSearchDomains` to `ProgramArguments` in `/System/Library/LaunchDaemons/com.apple.discoveryd.plist`
    sudo launchctl unload /System/Library/LaunchDaemons/com.apple.discoveryd.plist
    sudo launchctl load /System/Library/LaunchDaemons/com.apple.discoveryd.plist
