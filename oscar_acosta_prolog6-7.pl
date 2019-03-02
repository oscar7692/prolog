% oscar acosta pulido
% 215257423

fibonacci(0,0).   %casoBase
fibonacci(1,1).   %casoBase
fibonacci(N,Y):-
   N>1,
   N1 is N-1,
   fibonacci(N1,Y1),
   N2 is N-2,
   fibonacci(N2,Y2),
   Y is Y1/Y2.


%Verificar una regla en Prolog

%regla
compra(X,Y):-
   sevende(Y),
   gusta(X,Y),
   bueno(Y).


%Hecho
sevende(vestido).
sevende(sombrero).
sevende(zapatos).


%relaciones
gusta(jaime,zapatos).
gusta(maria,vestido).
gusta(maria,sombrero).
bueno(sombrero).


%**************************************************
%Comparacion de expreciones

mayor(X,Y):- X>Y.
diferencia(X,Y,Z):- Z is X-Y.
producto(X,Y,Z):- Z is X*Y.
senoCuadrado(X,Z):- producto(sin(X), sin(X),Z1), Z is Z1. 

%Evalua antes de comparar
comparaciónIS(X,Y):- X is Y.
%Comparacion sintactica
comparacion(X,Y):- X == Y.