#https://stackoverflow.com/a/46188210
venv: venv/touchfile

venv/touchfile: requirements.txt
	test -d .venv || virtualenv .venv
	. .venv/bin/activate; pip install -Ur requirements.txt
	touch .venv/touchfile

install:
	python -m venv .venv
	source ./.venv/bin/activate
	pip install -r requirements.txt

test-setup:
	. .venv/bin/activate; robot --outputdir output tests/test_setup.robot

test:
	. .venv/bin/activate; robot --outputdir output -e test-setup tests/*.robot 

clean:
	rm -rf output

clean-test: clean test