PACKAGES = hypr rofi ghostty zsh nvim test-config

all:
	stow -v -R -t ~ $(PACKAGES)

delete:
	stow -v -D -t ~ $(PACKAGES)

.PHONY: all delete
