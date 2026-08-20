PACKAGES = hypr rofi ghostty zsh nvim

all:
	stow -v -R -t ~ $(PACKAGES)

delete:
	stow -v -D -t ~ $(PACKAGES)

.PHONY: all delete
