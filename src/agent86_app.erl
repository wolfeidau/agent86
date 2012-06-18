-module(agent86_app).

-behaviour(application).

%% Application callbacks
-export([start/2, stop/1]).

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").
-endif.

%% ===================================================================
%% Application callbacks
%% ===================================================================

start(_StartType, _StartArgs) ->
    agent86_sup:start_link().

stop(_State) ->
    ok.

%% ===================================================================
%% EUnit tests
%% ===================================================================
-ifdef(TEST).

simple_test() ->
    ok = application:start(agent86),
    ?assertNot(undefined == whereis(agent86_sup)).

-endif.
