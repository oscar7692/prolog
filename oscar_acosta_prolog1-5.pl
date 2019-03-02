% oscar acosta pulido
% 215257423

isNumber(2).
isNumber(232423).
isNumber(-3454).
isNumber(-8.87).
isNumber(2.1416).
isNumber(0.234).
isNumber(2e10).
isNumber(3e-24).
isNumber(2e2).
%isNumber(.87767).

isAtom(diana).
isAtom('Diana Navarro').
isAtom('$&&/*').
isAtom(dIAAng112).
isAtom(i_am_dIAna_23).

isVariable(Var).
isVariable(_var).
isVariable(Di112sdf).
isVariable(d_i_a_a_n_g).
isVariable(_).

name(arg1).
name(arg1, arg2, arg3).
name(Var).
name(2, 3, asd, _var).

filosofo(aristoteles).
filosofo(platon).

fisico(faraday).
fisico(feynman).

matematico(gauss).
matematico(wiles).

sabe_matematicas(diana):-matematico(diana).
sabe_fisica(diana):-fisico(diana).
sabe_fisica(diana):-fisico(diana).
sabe_filosofia(diana):-filosofo(diana).

progenitor(clara,jose).        %Hecho 1
progenitor(tomas, jose).       %Hecho 2
progenitor(tomas,isabel).      %Hecho 3
progenitor(jose, ana).         %Hecho 4
progenitor(jose, patricia).    %Hecho 5
progenitor(patricia,jaime).    %Hecho 6

padre(jose, jesus).
padre(jesus, sofia).
padre(jesus, alejandro).
padre(jose, juan).
padre(jose, alvaro).
padre(jose, gustavo).
padre(gustavo, william).
padre(gustavo, felipe).
padre(gustavo, oscar).
padre(gustavo, luis).
padre(juan, manuel).
padre(manuel, esteban).
padre(manuel, antonio).
padre(manuel, martin).
padre(alvaro, tomas).
padre(danilo, anabel).

madre(maria, jesus).
madre(magdalena, sofia).
madre(magdalena, alejandro).
madre(maria, juan).
madre(maria, alvaro).
madre(maria, gustavo).
madre(josefina, anabel).
madre(anabel, manuel).
madre(clementina, esteban).
madre(clementina, antonio).
madre(clementina, martin).

hijo(X,Y):-padre(Y,X).
hijo(X,Y):-madre(Y,X).

abuelo(X,Y):-padre(Z,Y),padre(X,Z).
abuelo(X,Y):-madre(Z,Y),madre(X,Z).

hermano(X,Y):-padre(Z,X),hijo(Y,Z),X\=Y.
hermano(X,Y):-madre(Z,X),hijo(Y,Z),X\=Y.

tio(X,Y):-padre(Z,Y),hermano(Z,X).
tio(X,Y):-madre(Z,Y),hermano(Z,X).

esposos(X,Y):-padre(X,Z),madre(Y,Z).
esposos(X,Y):-madre(X,Z),padre(Y,Z).

sobrino(X,Y):-tio(Y,X).

primo(X,Y):-padre(Z,Y),tio(Z,X).
primo(X,Y):-madre(Z,Y),tio(Z,X).

cunado(X,Y):-hermano(Z,Y), esposos(Z,X).

nieto(X,Y):-abuelo(Y,X).

bisabuelo(X,Y):-abuelo(X,Z),padre(Z,Y).
bisabuelo(X,Y):-abuelo(X,Z),madre(Z,Y).

bisnieto(X,Y):-bisabuelo(Y,X).

yerno_nuera(X,Y):-hijo(Z,Y),esposos(X,Z).

suegro(X,Y):-yerno_nuera(Y,X).



animal_carnívoro( X ):- animal( X ), carnívoro( X ).

predecesor(X,Y):-progenitor(X,Y).                                   %padre
predecesor(X,Y):-progenitor(X,Z), progenitor(Z,Y).                  %abuelo
predecesor(X,Y):-progenitor(X,Z), progenitor(Z,V), progenitor(V,Y). %bisabuelo


predecesor(X,Y):-progenitor(X,Y).                    %caso base
predecesor(X,Y):-progenitor(X,Z), predecesor(Z,Y).   %caso recursivo

/*Ejemplo Práctico*/

madre(X,Y):-
    mujer(X),
    progenitor(X,Y).

padre(X,Y):-
    hombre(X),
    progenitor(X,Y).

%Hechos
mujer(clara).
mujer(isabel).
mujer(ana).
mujer(patricia).
hombre(tomas).
hombre(jose).
hombre(jaime).

abuelo(X,Y):-
    progenitor(X,Z),
    progenitor(Z,Y).

antepasado(X,Y):-
    progenitor(X,Y).

antepasado(X,Y):-
    progenitor(X,Z),
    antepasado(Z,Y).