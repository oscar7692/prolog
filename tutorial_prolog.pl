%hechos
%padres
padre(jose,jesus).
padre(jesus,sofia).
padre(jesus,alejandro).
padre(jose,juan).
padre(jose,alvaro).
padre(jose,gustavo).
padre(gustavo,william).
padre(gustavo,felipe).
padre(gustavo,oscar).
padre(gustavo,luis).
padre(gustavo,sandra).
padre(juan,manuel).
padre(manuel,esteban).
padre(manuel,antonio).
padre(manuel,martin).
padre(alvaro,tomas).
padre(danilo,anabel).

%madres
madre(maria,jesus).
madre(magdalena,sofia).
madre(magdalena,alejandro).
madre(maria,juan).
madre(maria,alvaro).
madre(maria,gustavo).
madre(josefina,anabel).
madre(anabel,manuel).
madre(clementina,esteban).
madre(clementina,antonio).
madre(clementina,martin).


%hijo o hija
hijo(X,Y):-padre(Y,X).
hijo(X,Y):-madre(Y,X).

%abuelo o abuela
abuelo(X,Y) :- padre(Z,Y), padre(X,Y).
abuelo(X,Y) :- madre(Z,Y), madre(X,Y).

%hermano o hermana
hermano(X,Y):-padre(Z,X),hijo(Y,Z),X\=Y.
hermano(X,Y):-madre(Z,X),hijo(Y,Z),X\=Y.

%tio o tia
tio(X,Y):-padre(Z,Y),hermano(Z,X).
tio(X,Y):-madre(Z,Y),hermano(Z,X).

%esposo o esposa
esposos(X,Y):-padre(X,Y),madre(Y,Z).
esposos(X,Y):-madre(X,Y),madre(Y,Z).

%sobrino o sobrina
sobrino(X,Y):-tio(Y,X).

%primo o prima
primo(X,Y):-padre(Z,Y),tio(Z,X).
primo(X,Y):-madre(Z,Y),tio(Z,X).

%cuniado o cuniada
cunado(X,Y):-hermano(Z,Y),esposos(Z,X).
cunado(X,Y):-hermano(Z,Y),esposos(Z,X).

%nieto o nieta
nieto(X,Y):-abuelo(Y,X).

%bisabuelo o bisaubeula
bisabuelo(X,Y):-abuelo(X,Z),padre(Z,Y).
bisabuelo(X,Y):-abuelo(X,Z),madre(Z,Y).

%bisnieto o bisniata
bisnieto(X,Y):-bisabuelo(Y,X).

%yerno o yerna
yerno_nuera(X,Y):-hijo(Z,Y),esposos(X,Z).

%suegro o suegra
suegro(X,Y):-yerno_nuera(Y,X).

progenitor(clara,jose).     %Hecho 1
progenitor(tomas, jose).    %Hecho 2
progenitor(tomas,isabel).   %Hecho 3
progenitor(jose, ana).      %Hecho 4
progenitor(jose, patricia). %Hecho 5
progenitor(patricia,jaime). %Hecho 6

%reglas recursivas
predecesor(X,Y):-progenitor(X,Y).
predecesor(X,Y):-progenitor(X,Y), progenitor(Z,Y).
predecesor(X,Y):-progenitor(X,Y), progenitor(Z,V), progenitor(V,Y).

 %caso base
predecesor(X,Y):-progenitor(X,Y).
%caso recursivo
predecesor(X,Y):-progenitor(X,Z), predecesor(Z,Y).


%backtracking
%fibonacci
fact(0,1).
fact(N,M):-N>0,N1 is N-1, fact(N1,M1), M is M1*N.
fibonacci(0,0). %caso base
fibonacci(1,1). %caso base
fibonacci(N,Y) :- N>1,
                    N1 is N-1,
                    fibonacci(N1,Y1),
                    N2 is N-2,
                    fibonacci(N2,Y2),
                    Y is Y1+Y2.

%expresiones aritmeticas
/** 
 Expresión 	Operación
X+Y 	suma de X e Y
X-Y 	X menos Y
X*Y 	producto de X por Y
X/Y 	cociente real de la división de X por Y
X//Y 	cociente entero de la división de X por Y
X^Y 	potencia entera de X a la Y
X**Y 	potencia real de X a la Y
X mod Y 	resto de la división entera de X por Y
abs(X) 	valor absoluto de X
acos(X) 	arco coseno de X
asen(X) 	arco seno de X
atan(X) 	arco tangente de X
cos(X) 	coseno de X
exp(X) 	exponencial de X; [eX]
ln(X) 	logaritmo neperiano de X
log(X) 	logaritmo en base 2 de X
sin(X) 	seno de X
sqrt(X) 	raíz cuadrada de X
tan(X) 	tangente de X
round(X,N) 	redondeo del real X con N decimales
X==Y 	la expresión X es igual que la expresión Y
X\==Y 	la expresión X es distinta que la expresión Y
X@<Y 	la expresión X es menor que la expresión Y
X@>Y 	la expresión X es mayor que la expresión Y
X@=<Y 	la expresión X es menor o igual que la expresión Y
X@>=Y 	la expresión X es mayor o igual que la expresión Y
X is Y 	Si Y es una expresión aritmética, ésta se evalúa y el                   resultado se intenta unificar con X.
X =:= Y 	cierto si los valores numéricos de X e Y son iguales
X =\= Y 	cierto si los valores numéricos de X e Y son distintos

Predicado 	Función
var 	El objetivo var(X) se cumple si X es una variable no instanciada.
nonvar 	El objetivo nonvar(X) se cumple si X es una variable instanciada
atom 	El objetivo atom(X) se cumple si X representa un átomo.
integer 	El objetivo integer(X) se cumple si X representa un número entero.
atomic 	El objetivo atomic(X) se cumple si X representa un entero o un átomo.

Los siguientes son predicados predefinidos que permiten controlar otros predicados.

Predicado 	Función
!(cut) 	Fuerza al sistema a mantener ciertas elecciones que ha realizado.
true 	Este objetivo siempre se cumple.
fail 	Este objetivo siempre fracasa.
not 	El objetivo not(X) se cumple si fracasa el intento de satisfacer X. El objetivo not(X) fracasa si el intento de satisfacer X tiene éxito. Es similar a la negación en la lógica de predicados.
repeat 	forma auxiliar para generar soluciones múltiples mediante el mecanismo de reevaluación.
call 	Se cumple si tiene éxito el intento de satisfacer X.
; 	Especifica una disyunción de objetivos
, 	Especifica una conjunción de objetivos

Predicados de lectura y escritura
Predicado 	Función
write 	escribe el término X en la consola de salida.
nl 	genera una nueva línea en la consola de salida.
read 	lee el siguiente término en la consola de entrada.
display 	funciona exactamente igual que write, excepto que


Litas

Se tiene que a es la cabeza de la lista y [b, c, d] la cola.
Lista 	Cabeza 	Cola
[a,b,c,d] 	a 	[b,c,d]
[a] 	a 	[]
[] 	no tiene 	no tiene
[[a,b],c] 	[a,b] 	[c]
[a,[b,c]] 	a 	[[b,c]]
[a,b,[c,d]] 	a 	[b,[c,d]]
 **/

[X,Y,Z]= [a,b,c]
X = a
Y = b
Z = c
X= [a,b,c]
[a,b,c] = [Cabeza|Cola]
Cabeza = a
Cola = [b,c]

[a,b,c] = [X,Y|Z]
X = a
Y = b
Z = [c]

[a,b,c] = [X,Y,Z|Cola]
X = a
Y = b
Z = c
Cola = [ ].

%listas y recurcion 

 /* Regla de terminacion
 predicado([ ]):- procesar([ ]).
 Regla recursiva
 predicado([Cabeza | Cola]):- procesar(Cabeza), predicado(Cola).

 Regla de terminación 
 predicado(Cabeza, [Cabeza | Cola]):- procesar algo.
 Regla recursiva 
 predicado(X, [Cabeza | Cola]):- procesar algo, predicado(X, Cola).
 Regla de terminacion 
 predicado(1,Cabeza, [Cabeza | Cola]):- procesar algo.
 Regla recursiva 
 predicado(P, X, [ | L]):- P1=P-1, predicado(P1,X, L).*/

%reglas de listas
%hayar el maximo de una lista
%maxlista([7,3,-1,-100,500,3,5,40],S).
maxlista([H],H).
maxlista([H|T],N):- maxlista(T,NT), N is max(NT,H).
%hallar minimo de una lista
%minlista([7,3,-1,-100,500,3,5,40],S).
minlista([H],H).
minlista([H|T],N):- minlista(T,NT), N is min(NT,H).
%invertir lista
%invlista([7,3,-1,-100,500,3,5,40],S).
invlista([],[]).
invlista([x|T],N):-invlista([x|T],[],N).
invlista([],Zs,Zs).
invlista([X|Xs],Ys,Zs):- invlista(Xs,[X|Ys],Zs).
%algoritmo merge sort 
llist([],0).
llist([_|T],N):- llist(T,NT),N is NT +1.
divHalf(List,A,B) :- llsplit(List,List,A,B).
llsplit(s,[],[],s).
llsplit(s,[_],[],s).
llsplit([H|T],[_,_|T2],[H|A],s) :- llsplit(T,T2,A,S).
merge([],H,H).
merge(H,[],H).
merge([H|T],[Y|K],[H|S]) :- H =< Y, merge(T, [Y|K],S).
merge([H|T],[Y|K],[Y|S]) :- Y =< H, merge([H|T],K,S).
mergesort([],[]).
mergesort([H],[H]).
mergesort([H|T],S):-
    llist(T,LEN),
    LEN > 0,
    divHalf([H|T],Y,Z),
    mergesort(Y,L1),
    mergesort(Z,L2),
    merge(L1,L2,s).

%Arboles binarios
%caso base
binary_tree(void).
%caso recursivo
binary_tree(t(K,L,R)) :-
    binary_tree(L),
    binary_tree(R).
%Inorder
inorder(nil, []).
inorder(t(K,L,R), List):-
    inorder(L,LL),
    inorder(R, LR),
    append(LL, [K|LR],List).
%Preorder
preorder(nil, []).
preorder(t(K,L,R), List):-
    preorder(L,LL),
    preorder(R, LR),
    append([K|LL], LR, List).
%Postorder
postorder(nil, []).
postorder(t(K,L,R), List):-
    postorder(L,LL),
    postorder(R, LR),
    append(LL, LR,R1),
    append(R1, [K], List).
%calcula cuantos nodos tinee un arbol binario con la representacion
weight([],0).
weight([L,_,R],N):-weight(L,NL),weight(R,NR), N is NL+NR+1.
%calcula la altura de un arbol binario con la representacion 2
depth([],0).
depth([L,_,R],N):- depth(L,NL),depth(R,NR),max(NL,NR,M), N is M+1.

%arboles N-Arios
mi_arbol_n_ario([7, [0.9], [15], [[42, ar]], [3.333]])
es_arbol_n_ario([]).
es_arbol_n_ario([_ | Hijos]) :- iterar_hijos(Hijos).

iterar_hijos([]).
iterar_hijos([Hijo | Lista]) :- es_arbol_n_ario(Hijo), iterar_hijos(Lista).

preorder([], []).
preorder([Padre | Hijos], Lista) :- iterar_preorder(Hijos, L),
        append([Padre], L, Lista).

iterar_preorder([], []).
iterar_preorder([Hijo | Lista], RecorridoHermanos) :-
     preorder(Hijo, Recorrido),
     iterar_preorder(Lista, RecorridoHermano),
     append(Recorrido, RecorridoHermano,
         RecorridoHermanos).

mi_arbol_n_ario( [5, [8, [7, [9]], [10]], [11, [1]]]).

?- mi_arbol_n_ario(Arbol), es_arbol_n_ario(Arbol), preorder(Arbol, Recorrido).
Arbol = [5, [8, [7, [9]], [10]], [11, [1]]],
Recorrido = [5, 8, 7, 9, 1.5, [hola, mundo], 3.3333, 10, 11, 1]