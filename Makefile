test:
	@ ./mvnw test

package: #dependencias
	@ ./mvnw clean package -DskipTests

image-build: package
	@ docker build -t caelum/clines-api .

run: image-build
	@ docker compose up -d

stop:
	@ docker compose down -v

deploy: image-build
	@ heroku container:login
	@ docker image tag caelum/clines-api:latest registry.heroku.com/alura-clines-teste/web:1
	@ heroku container:push web --app $(APP_NAME)
	@ heroku container:release web --app $(APP_NAME)