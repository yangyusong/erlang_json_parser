%%%---------------------------------------------------------------------
%%%
%%% @author qingting
%%% @date  2011.12.29
%%% @email yys159258@126.com
%%% @doc json parser
%%% @end
%%%
%%%----------------------------------------------------------------------
Nonterminals list object kv_list v_list kv k v. % 7

Terminals ',' ':' 'element' '[' ']' '{' '}'. % 7

Rootsymbol object.

object -> '{' '}' : {}.
object -> '{' kv_list '}' : { '$2' }.


kv_list -> kv ',' kv_list : '$1' , '$3'.
kv_list -> kv : '$1'.

kv -> k ':' v : {'$1', '$3'}.

k -> 'element' : '$1'.

v -> 'element' : '$1'.
v -> list : '$1'.
v -> object : '$1'.

list -> '[' ']' : [].
list -> '[' v_list ']' : [ '$2' ].

v_list -> v ',' v_list : '$1' , '$3'.
v_list -> v.
