% oscar acosta pulido
% 215257423

/*
%Regla de terminacion
predicado([ ]):- procesar([ ]).

%Regla recursiva 
predicado([Cabeza | Cola]):- procesar(Cabeza), predicado(Cola).

%Regla de terminación 
predicado(Cabeza, [Cabeza | Cola]):- procesar algo.
 
%Regla recursiva 
predicado(X, [Cabeza | Cola]):- procesar algo, predicado(X, Cola).

%Regla de terminacion 
predicado(1,Cabeza, [Cabeza | Cola]):- procesar algo.
 
%Regla recursiva 
predicado(P, X, [ | L]):- P1=P-1, predicado(P1,X, L).
*/

%Encontrar el último elemento de una lista
ultimo(X,[X]).
ultimo(X,[_|L]) :- ultimo(X,L).

%Encontrar el k-esimo elemento de una lista
elemento_k(X,[X|_],1).
elemento_k(X,[_|L],K) :-
    K>1,
    K1 is K - 1,
    elemento_k(X,L,K1).

%Calcular la longitud de la lista
longitud([],0).
longitud([_|Cola],N) :-
    longitud(Cola,N1),
    N is N1 + 1.

%Verificar si una palabra es palindromo
es_palindromo(L) :-
    reverse(L,L).

%Crear una lista que contenga los enteros de un rango
rango(I,I,[I]).
rango(I,K,[I|L]) :-
    I < K,
    I1 is I + 1,
    rango(I1,K,L).

%Sumar los elementos de una lista
suma([],0).
suma([X|L],N) :-
    suma(L,C),
    N is C + X.

%**************************************************

%REGLAS EN LISTAS

%Maximo de la lista
maxlista([H],H).
maxlista([H|T],N):- maxlista(T,NT), N is max(NT,H).

%Minimo de la lista
minlista([H],H).
minlista([H|T],N):- minlista(T,NT), N is min(NT,H).

%Invertir lista
invlista([],[]).
invlista( [X|T],N):-invlista( [X|T],[],N).
invlista([],Zs,Zs).
invlista( [X|Xs],Ys,Zs):-invlista(Xs,[X|Ys],Zs).

% Ordenar con Merge Sort
llist([],0).
llist([_|T],N):- llist(T,NT),N is NT + 1.

divHalf(List,A,B) :- llsplit(List, List, A,B).
llsplit(S,[],[],S).
llsplit(S,[_],[],S).
llsplit([H|T],[_,_|T2],[H|A],S) :- llsplit(T,T2,A,S).

merge([], H, H).
merge(H, [], H).
merge([H|T], [Y,K], [H,S]) :- H =< Y, merge(T, [Y|K], S).
merge([H|T], [Y,K], [Y,S]) :- Y =< H, merge([H|T], K, S).

mergesort( [],[] ).
mergesort( [H], [H] ).
mergesort( [H|T], S) :-
    llist(T,LEN),
    LEN > 0,
    divHalf([H|T], Y, Z),
    mergesort(Y, L1),
    mergesort(Z, L2),
    merge(L1, L2, S).



% Representacion

binary_tree(void). %caso base
%caso recursivo
binary_tree(t(K,L,R)):-
    binary_tree(L),
    binary_tree(R).

tree1(t(6, t(4, t(2, nil, nil), t(5, nil, nil)), t(9, t(7, nil, nil), nil))).

%Inorder
inorder(nil, []).
inorder(t(K,L,R), List):-inorder(L,LL),
                         inorder(R, LR),
                         append(LL, [K|LR],List).

%Preorder
preorder(nil, []).
preorder(t(K,L,R), List):-preorder(L,LL),
                          preorder(R, LR),
                          append([K|LL], LR, List).

%Postorder
postorder(nil, []).
postorder(t(K,L,R), List):-postorder(L,LL),
                           postorder(R, LR),
                           append(LL, LR,R1),
                           append(R1, [K], List).



%Representación de arbol de arriba
%Calcular cuantos nodos tiene un arbol binario
weight([],0).
weight([L,_,R],N):- weight(L,NL), weight(R,NR), N is NL+NR+1.

%Calcular la altura de un arbol bonario
depth([],0).
depth([L,_,R],N):- depth(L,NL), depth(R,NR), max(NL,NR,M), N is M+1.


%Arboles N-arios
mi_arbol_n_ario([7, [0.9], [15], [[42, ar]], [3.333]]).

es_arbol_n_ario([]).
es_arbol_n_ario([_ | Hijos]) :- iterar_hijos(Hijos).

iterar_hijos([]).
iterar_hijos([Hijo | Lista]) :- es_arbol_n_ario(Hijo), iterar_hijos(Lista).

preorder([], []).
preorder([Padre | Hijos], Lista) :- iterar_preorder(Hijos, L),
        append([Padre], L, Lista).

iterar_preorder([], []).
iterar_preorder([Hijo | Lista], RecorridoHermanos) :- preorder(Hijo, Recorrido),
        iterar_preorder(Lista, RecorridoHermano),
    	append(Recorrido, RecorridoHermano, RecorridoHermanos).
