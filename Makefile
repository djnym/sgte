ERLANG_VERSION:=$(shell erl -eval 'io:format("~s",[erlang:system_info(otp_release)]), halt().'  -noshell)

all:
	@rebar get-deps compile

edoc:
	@rebar skip_deps=true doc

check:
	@rm -rf .eunit
	@mkdir -p .eunit
	@case $(ERLANG_VERSION) in \
	   R*) \
	     dialyzer -Wno_opaque -Wno_return --src src \
		 ;; \
	   18|19|2[0-9]) \
	     dialyzer -Wno_opaque -Wno_return -Dnamespaced_types=true --src src \
		 ;; \
	  esac
	@rebar skip_deps=true eunit

clean:
	@rebar clean

maintainer-clean:
	@rebar clean
	@rebar delete-deps
	@rm -rf deps
