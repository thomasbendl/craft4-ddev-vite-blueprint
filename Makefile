.PHONY: build dev up insadmintall

build: up
	ddev exec yarn build
dev: up
	ddev exec yarn build
	ddev launch
	ddev exec yarn dev
install: up build
	ddev exec php craft setup/app-id \
		$(filter-out $@,$(MAKECMDGOALS))
	ddev exec php craft setup/security-key \
		$(filter-out $@,$(MAKECMDGOALS))
	ddev exec php craft install \
		$(filter-out $@,$(MAKECMDGOALS))
	ddev exec php craft plugin/install redactor
	ddev exec php craft plugin/install seomatic
	ddev exec php craft plugin/install vite
up:
	if [ ! "$$(ddev describe | grep OK)" ]; then \
		ddev start; \
		ddev composer install; \
		ddev exec yarn install; \
    fi
%:
	@:
# ref: https://stackoverflow.com/questions/6273608/how-to-pass-argument-to-makefile-from-command-line