default: install

dependencies:
	@command -v stow >/dev/null 2>&1 || brew install stow 2>/dev/null || apt-get install -y stow 2>/dev/null || yum install -y stow 2>/dev/null || { echo >&2 "Please install GNU stow"; exit 1; }

stow:
	stow git
	stow screen
	stow tmux
	stow vim
	stow zsh

chsh:
	chsh -s `which zsh`

install: dependencies stow chsh
