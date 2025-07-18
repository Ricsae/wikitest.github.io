install:
	pip install mkdocs pymdown-extensions mkdocs-material
build:
	mkdocs build --config-file mkdocs-prod.yml
dev:
	mkdocs serve
