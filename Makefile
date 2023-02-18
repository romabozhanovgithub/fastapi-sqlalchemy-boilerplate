APP_FOLDER=app/

lint:
	@echo "Running linters..."
	black --exclude=venv,build,docs,tests,examples,setup.py,setup.cfg,Makefile,*.egg-in $(APP_FOLDER)
	flake8 --ignore=E501,E402,E731,E722,E741,W503,W504,W605 --exclude=venv,build,docs,tests,examples,setup.py,setup.cfg,Makefile,*.egg-in $(APP_FOLDER)
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

stop:
	@echo "Stopping app..."
	docker-compose down
	@echo "Complete."

clean:
	@echo "Cleaning up..."
	rm -rf build/
	rm -rf dist/
	rm -rf *.egg-info
	rm -rf .pytest_cache/
	rm -rf .mypy_cache/
	rm -rf .coverage
	rm -rf .coverage.*
	rm -rf .cache
	rm -rf .tox
	rm -rf .eggs
	rm -rf .pytest_cache
	rm -rf .coverage
	@echo "Cleanup complete."
