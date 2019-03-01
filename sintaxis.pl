/** numeros **/

isNumber(2).
isNumber(232423).
isNumber(-3254).
isNumber(-8.87).
isNumber(2.1416).
isNumber(0.234).
isNumber(2e10).
isNumber(3e-24).
isNumber(.87767).

/** Atomos o functores**/

isAtom(pedro)
isAtom('Camilo Perez').
isAtom('$&&/*').
isAtom(atOmMm12345).
isAtom(i_am_AToMm_23).


/** variables  **/

isVariable(Var).
isVariable(_var).
isVariable(Va2323sdf).
isVariable(V_a_w_3).
isVariable(_).


/** Estructuras **/

/** functor Arguentos **/
name(arg1).
name(arg1,arg2,arg3).
name(Var)
name(2,3,asd,_var)


/* Equivale a:
para todo X e Y, si X es mujer y X es el progenitor de Y,
entonces X es la madre de Y */

madre(X,Y):
mujer(X),
progenitor(X,Y).


/* Equivale a:
 para todo X e Y, si X es hombre y X es el progenitor de Y,
entonces X es el padre de Y */

padre(X,Y):
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


%Relaciones
progenitor(clara,jose).         %Hecho 1
progenitor(tomas, jose).        %Hecho 2
progenitor(tomas,isabel).       %Hecho 3
progenitor(jose, ana).          %Hecho 4
progenitor(jose, patricia).     %Hecho 5
progenitor(patricia,jaime).     %Hecho 6
