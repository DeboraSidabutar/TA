

sail := vendor/bin/sail

.PHONY: rm
rm:
	$(sail) down -v

.PHONY: up
up:
	$(sail) up

.PHONY: 

.PHONY: backend-install
backend-install:
	$(sail) composer i

.PHONY: backend-setup
backend-setup:
	make backend-install
	$(sail) artisan key:generate

.PHONY: backend-migrate
backend-migrate:
	$(sail) artisan migrate --seed

.PHONY: frontend-clean
frontend-clean:
	rm -rf node_modules 2>/dev/null || true
	rm package-lock.json 2>/dev/null || true
	$(sail) yarn cache clean

.PHONY: frontend-install
frontend-install:
	make frontend-clean
	$(sail) npm install
	$(sail) npm run build

.PHONY: dev
dev:
	make docker-setup
	make backend-setup
	make frontend-install

.PHONY: watch
watch:
	$(sail) npm run dev 


.PHONY: clear
clear:
	$(sail) php artisan view:clear
	$(sail) php artisan view:cache
	$(sail) php artisan route:clear
	$(sail) php artisan route:cache
	$(sail) php artisan config:clear
	$(sail) php artisan config:cache