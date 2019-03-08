%hechos
agrada(rodolfo,telma).
agrada(juan,lucia).
agrada(esmeralda,pablo).
agrada(lucia,rodolfo).
agrada(pablo,esmeralda).
agrada(kevin,aldo).
agrada(karla,rodolfo).

%reglas
amigos(X,Y):-agrada(X,Y),agrada(Y,X).