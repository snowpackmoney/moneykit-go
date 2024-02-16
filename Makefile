SHELL=/bin/bash

.PHONY: generate
generate:
	docker run --rm -v .:/local openapitools/openapi-generator-cli:v7.3.0 generate -i https://api.moneykit.com/openapi.json -c /local/openapi/config.yml -g go -o /local

.PHONY: clean
clean:
	cat .openapi-generator/FILES | xargs rm -f
	rm -rf .openapi-generator
	rm -rf docs
