SHELL := /usr/bin/env zsh

.PHONY: default
default: help

# -----------------------------------------------------------------------------------
# Develop

.PHONY: develop
dev:									               ## Start Development
	@$(SHELL) -c 'start development server'

# -----------------------------------------------------------------------------------
# Help

define HELPTEXT

endef
export HELPTEXT
.PHONY: help
help: ## Show this help menu.
	@echo "Usage: make [TARGET ...]"
	@echo ""
	@grep --no-filename -E '^[a-zA-Z_%-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
	@echo "$$HELPTEXT"
