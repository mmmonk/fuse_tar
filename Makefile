SHELL = /bin/sh

.PHONY  : all
.SILENT : all
.DEFAULT: all

all: tags lint

lint: *.py
	@echo "[$@] testing for compilation errors"
	python3 -m pylint -f parseable -r n $?
	mypy --strict $?
	touch $@

tags: *.py
	@echo "[$@] running ctags"
	ctags $?

