%%%---------------------------------------------------------------------
%%%
%%% @author qingting
%%% @date  2011.12.29
%%% @email yys159258@126.com
%%% @doc json解析的使用
%%% @end
%%%
%%%----------------------------------------------------------------------
-module(use_json_parser).

-export([parser/1]).
-ifdef(EUNIT).
-include_lib("eunit/include/eunit.hrl").
-endif.

parser(Str) ->
    element(2,erl_scan:string(Str)) ++ [{'$end',999}] .

-ifdef('EUNIT').
unit_test_() ->
    ?_assertEqual(parser("{}"), [{'{',1},{'}',1},{'$end',999}]),
    ?_assertEqual(parser("[b, c]"), [{'[',1},{atom,1,b},{',',1},{atom,1,c},{']',1},{'$end',999}]),
    ?_assertEqual(parser("{a, b, c}"), [{'{',1},
                                        {atom,1,a},
                                        {',',1},
                                        {atom,1,b},
                                        {',',1},
                                        {atom,1,c},
                                        {'}',1},
                                        {'$end',999}]),
    ?_assertEqual(parser("[]"), [{'[',1},{']',1},{'$end',999}]).
-endif.