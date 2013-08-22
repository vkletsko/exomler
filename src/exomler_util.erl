-module(exomler_util).
-export([get_path/2]).

get_path(Path, Entity) ->
    get_elem(Path, Entity, []).

get_elem([], [], []) -> not_found;
get_elem([], [], Acc) -> lists:reverse(Acc);
get_elem(_Path, [], []) -> not_found;
get_elem(_Path, [], Acc) -> lists:reverse(Acc);

get_elem([Br|T], {Br, _, Rest}, Acc) ->
    get_elem(T, Rest, Acc);
get_elem(Path, {_,_, Rest}, Acc) ->
    get_elem(Path, Rest, Acc);
get_elem([Br|[]], [{Br, _, _} = Elem|T], Acc) ->
    get_elem([Br|[]], T, [Elem|Acc]);
get_elem([Br|Brunches], [{Br, _, Rest}|_T], Acc) ->
    get_elem(Brunches, Rest, Acc);
get_elem(Path, [{_,_,_}|T], Acc) ->
    get_elem(Path, T, Acc).
