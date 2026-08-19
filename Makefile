all:
	stow -v -R -t ~ hypr rofi ghostty

delete:
	stow -v -D -t ~ hypr rofi ghostty

.PHONY: all delete
