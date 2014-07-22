## Installation

    git clone https://github.com/pmccarren/dotfiles.git ~/.dotfiles
    cd ~/.dotfiles
    make

#### Fixup Remote Sudo

    echo 'Defaults:%sudo env_keep += "SSH_CLIENT SSH_TTY SSH_CONNECTION"' >> /etc/sudoers
