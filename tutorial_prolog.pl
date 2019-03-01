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
padre(juan,manuel)
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
abuelo(X,Y):-padre(Z,Y),padre(X,Y).
abuelo(X,Y):-madre(Z,Y),madre(X,Y).

%hermano o hermana
hermano(X,Y):-padre(Z,X),hijo(Y,Z),X/=Y.
hermano(X,Y):-madre(Z,X),hijo(Y,Z),X/=Y.

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

%reglas recursivas
predecesor(X,Y):-progenitor(X,Y).
predecesor(X,Y):-progenitor(X,Y), progenitor(Z,Y).
predecesor(X,Y):-progenitor(X,Y), progenitor(Z,V), progenitor(V,Y).

predecesor(X,Y):-progenitor(X,Y).                    %caso base
predecesor(X,Y):-progenitor(X,Z), predecesor(Z,Y).   %caso recursivo


%backtracking
%fibonacci

fibonacci
