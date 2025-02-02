service:= test-app
overlay := dev

.PHONY: default
default: ## Deploy using Kustomize
	cd ./lib/$(service)/overlays/$(overlay) \
		&& kustomize build | kubectl apply -f -

.PHONY: delete
delete: ## Deploy using Kustomize
	cd ./lib/$(service)/overlays/$(overlay) \
		&& kustomize build | kubectl delete --ignore-not-found -f -

.PHONY: help
help: ## Display this help screen
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
