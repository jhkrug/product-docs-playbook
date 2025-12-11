local: environment
	mkdir -p tmp
	npx antora --version
	npx antora --stacktrace --log-format=pretty --log-level=info \
		product-docs-playbook-local.yml \
		2>&1 | tee tmp/local-build.log 2>&1

remote: environment
	mkdir -p tmp
	npm ci
	npx antora --version
	npx antora --stacktrace --log-format=pretty --log-level=info \
		product-docs-playbook-remote.yml \
		2>&1 | tee tmp/remote-build.log 2>&1

clean:
	rm -rf build

environment:
	npm ci || npm install
	bundle install

preview:
	npx http-server build/site -c-1
