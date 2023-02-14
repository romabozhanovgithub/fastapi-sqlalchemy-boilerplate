lint:
	@echo "Running linters..."
	flake8 --ignore=E501,E402,E731,E722,E741,W503,W504,W605 --exclude=venv,build,docs,tests,examples,setup.py,setup.cfg,Makefile,*.egg-in app/
	mypy app/
	@echo "Linting complete."

test:
	@echo "Running tests..."
	pytest -v --cov=app --cov-report term-missing --cov-fail-under=100 -ra tests/
	@echo "Tests complete."

run-build:
	@echo "Running app with build..."
	docker-compose up --build
	@echo "Complete."

run:
	@echo "Running app..."
	docker-compose up
	@echo "Complete."
