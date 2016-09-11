##
##
## @file __PROJECT-NAME__/makefile
## @modified 2016-09-11 16:46:25 (CEST)
## @author __USER-NAME__
## @brief build targets
##
##

PR = __PROJECT-NAME__
SHELL = /bin/bash
OBJECTS =
LIBS = glib-2.0
DFLAGS = -g
TSTDIR = tst/
SRCDIR = src/
DOCDIR = doc/
CFLAGS = -pedantic-errors ${DFLAGS} -Wall -std=gnu99 ${OPT} -I${SRCDIR} `pkg-config --cflags --libs ${LIBS}`
OPT = -O0
CC = gcc

.PHONY: doc all clean help

##	@brief Target: all -> build project, compile and run unit tests
all: ${PR} test

##	@brief Target: ${PR} -> compile project
${PR}: ${SRCDIR}*.c
	${CC} ${CFLAGS} $? -o $@

##	@brief Target: test -> compile and run unit tests
test: $(patsubst %.c,%.log,$(wildcard ${TSTDIR}*.c))

${TSTDIR}%.out: ${TSTDIR}%.c
	${CC} ${CFLAGS} $? -o $@

${TSTDIR}%.log: ${TSTDIR}%.out
	gtester -k -m=quick --verbose -o=$@ $?

## @brief Target: doc -> run doxgen to create documentation
doc:
	doxygen ${DOCDIR}doxyfile

##	@brief Target: dist -> compress project for distribution
dist:
	find . -maxdepth 1 ! -name ".*" | xargs tar cvfz ../${PR}.tar.gz

##	@brief Target: help -> Show make targets
help:
	 @fgrep -h "##" ${MAKEFILE_LIST} | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

##	@brief Target: clean -> Remove all temporary files
clean:
	find . -maxdepth 2 -name "*.o" -o -name "*.dSYM" -o -name "*.out" -o -name "*~" -o -name "*#" -o -name "*.log" -o -name ${PR} | xargs rm -r -f
