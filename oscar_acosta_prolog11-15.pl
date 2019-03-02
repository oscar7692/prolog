% oscar acosta pulido
% 215257423


edge(a,b).
edge(b,e).
edge(a,c).
edge(c,d).
edge(e,d).
edge(d,f).
edge(d,g).

path(X,Y) :- edge(X,Y).
path(X,Y) :- edge(X,Z), path(Z,Y).


% Automatas

automata(S,[],S).
automata(S, [H|T],F):- d(S,H,AUX), automata(AUX,T,F).
d(q0,a,q1).
d(q0,b,q1).
d(q1,a,q0).
d(q1,b,q0).

% automata definido

parse(L) :- inicio(S),
            transicion(S,L).

transicion(X,[A|B]) :-
      delta(X,A,Y),
      write(X),
      write('  '),
      write([A|B]),
      nl,
      transicion(Y,B).

transicion(X,[]) :-
      final(X),
      write('  '),
      write([]), nl.

delta(0,a,1).
delta(0,b,0).
delta(1,a,1).
delta(1,b,2).
delta(2,a,2).
delta(2,b,2).

inicio(0).
final(2).


evaluar:-
hipotesis(Enfermedad),
write('Creo que el paciente tiene '),
write(Enfermedad),
nl,
write('Tener cuidado!!!'),
deshacer.

%Hipotesis

hipotesis(resfriado) :- resfriado.
hipotesis(gripe) :- gripe.
hipotesis(tifoidea) :- tifoidea.
hipotesis(sarampion) :- sarampion.
hipotesis(malaria) :- malaria.
hipotesis(desconocido).

%Reglas

resfriado :-
verificar(dolor_cabeza),
verificar(nariz_moqueda),
verificar(estornudo),
verificar(dolor_garganta),
write('Consejos y Sugerencias: '),
nl,
write('1: Tylenol'),
nl,
write('2: Panadol'),
nl,
write('3: Aerosol nasal'),
nl,
write('Por favor use abrigo porque '),
nl.

%Como se verifica

verificar(S) :-
(si(S) -> true;
(no(S) -> fail;
preguntar(S))).

%Hacer las preguntas
preguntar(Pregunta) :-
write('El paciente tiene los siguientes sintomas: '),
write(Pregunta),
write('? '),
read(Respuesta),
nl,
( (Respuesta == si)
->
assert(si(Pregunta)) ;
assert(no(Pregunta)), fail).