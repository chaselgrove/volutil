# See file COPYING distributed with volutil for copyright and license.

.PHONY : devel build upload clean clobber upload-test

default : build

devel : 
	test ! -z $(VIRTUAL_ENV) && python3 -m pip install -e .

build : 
	python3 -m build

upload : build
	python3 -m twine upload dist/*

upload-test : build
	python3 -m twine upload --repository testpypi dist/*

clean : 
	rm -rf volutil.egg-info
	find . -name __pycache__ -type d -exec rm -rf {} +

clobber : clean
	rm -rf dist

# eof
