NAME=sgte

all:
	rebar3 compile

test:
	rebar3 as test dialyzer,eunit,cover

name:
	@echo $(NAME)

version:
	@echo $(shell awk 'match($$0, /[0-9]+\.[0-9]+(\.[0-9]+)+/){print substr($$0, RSTART,RLENGTH); exit}' ChangeLog)

clean:
	rebar3 clean

maintainer-clean: clean
	rm -rf _build ebin

.PHONY:	all test name version clean maintainer-clean
