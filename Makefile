install:
	brew install --build-from-source ./Formula/picordm.rb

version = 0.5.0

download:
	curl -LO https://github.com/osdodo/picordm/releases/download/v$(version)/picordm-v$(version)-macos-aarch64.tar.gz
	curl -LO https://github.com/osdodo/picordm/releases/download/v$(version)/picordm-v$(version)-macos-x86_64.tar.gz
	curl -LO https://github.com/osdodo/picordm/releases/download/v$(version)/picordm-v$(version)-linux-arm64.tar.gz
	curl -LO https://github.com/osdodo/picordm/releases/download/v$(version)/picordm-v$(version)-linux-x86_64.tar.gz
	mkdir -p bin
	mv picordm-* bin/.

shasum:
	shasum -a 256 bin/picordm-v$(version)-macos-aarch64.tar.gz
	shasum -a 256 bin/picordm-v$(version)-macos-x86_64.tar.gz
	shasum -a 256 bin/picordm-v$(version)-linux-arm64.tar.gz
	shasum -a 256 bin/picordm-v$(version)-linux-x86_64.tar.gz
