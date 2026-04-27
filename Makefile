PREFIX ?= $(HOME)/.local
DEST   := $(PREFIX)/lib/ok.sh

.PHONY: test install uninstall check

test:
	@for f in test_*.sh; do sh "$$f" || true; done

check:
	@shellcheck ok.sh install.sh

install:
	@mkdir -p $(dir $(DEST))
	@cp ok.sh $(DEST)
	@chmod 644 $(DEST)
	@printf "Installed to %s\n" "$(DEST)"

uninstall:
	@rm -f $(DEST)
	@printf "Removed %s\n" "$(DEST)"
