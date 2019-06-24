%ARBOL GENEALOGICO

%VARONES
%varon(x): x es varon
varon(alipio).
varon(isaac).
varon(samuel).
varon(jaime).
varon(fidel).
varon(manuel).
varon(francisco).
varon(cecilio).
varon(juan).
varon(yuri).
varon(julian).
varon(stefano).
varon(christian).
varon(alberto).
varon(jhoel).
varon(matthew).
varon(miguel).
varon(salvador).

%MUJERES
%mujer(x): x es mujer
mujer(lucia).
mujer(petronila).
mujer(gaby).
mujer(rosa).
mujer(maria_lucia).
mujer(luzdelia).
mujer(nancy).
mujer(gabriela).
mujer(luciana).
mujer(graciela).
mujer(kony).
mujer(jessica).
mujer(grisell).
mujer(gisela).
mujer(cecilia).
mujer(maria_elena).
mujer(viviana).
mujer(gigi).
mujer(maria_rosa).
mujer(liz_fanny).
mujer(ruby).
mujer(vilma).
mujer(any).
mujer(dayana).

%relacion de padre
%padre(x,y): x es padre de y
padre(alipio,petronila).
padre(alipio,isaac).
padre(alipio,maria_lucia).
padre(alipio,samuel).
padre(alipio,jaime).
padre(alipio,fidel).
padre(francisco,gaby).
padre(francisco,yuri).
padre(julian,stefano).
padre(isaac,christian).
padre(cecilio,luzdelia).
padre(cecilio,nancy).
padre(alberto,gabriela).
padre(alberto,luciana).
padre(samuel,jhoel).
padre(samuel,kony).
padre(jaime,grisell).
padre(jaime,gisela).
padre(fidel,liz_fanny).
padre(fidel,ruby).
padre(manuel,maria_rosa).
padre(manuel,maria_elena).
padre(juan,matthew).
padre(juan,viviana).
padre(juan,gigi).
padre(miguel,salvador).
padre(fidel,any).
padre(fidel,dayana).

%relacion de madre
%madre(x,y): x es madre de y
madre(lucia,petronila).
madre(lucia,isaac).
madre(lucia,maria_lucia).
madre(lucia,samuel).
madre(lucia,jaime).
madre(lucia,fidel).
madre(petronila,gaby).
madre(petronila,yuri).
madre(gaby,stefano).
madre(rosa,christian).
madre(maria_lucia,luzdelia).
madre(maria_lucia,nancy).
madre(nancy,gabriela).
madre(nancy,luciana).
madre(graciela,jhoel).
madre(graciela,kony).
madre(jessica,grisell).
madre(jessica,gisela).
madre(cecilia,maria_elena).
madre(cecilia,maria_rosa).
madre(maria_elena,matthew).
madre(maria_elena,viviana).
madre(maria_elena,gigi).
madre(maria_rosa,liz_fanny).
madre(maria_rosa,ruby).
madre(liz_fanny,salvador).
madre(vilma,any).
madre(vilma,dayana).

%REGLAS
diferente(X,Y):-not(X=Y).
%abuelo(X,Y): Xes abuelo dde Y.
abuelo(X,Y):-padre(X,Z),((padre(Z,Y));(madre(Z,Y))).

%abuela
abuela(X,Y):-madre(X,Z),((padre(Z,Y));(madre(Z,Y))).

%hijo(x,y):x es hijo de y
hijo(X,Y):-varon(X),(padre(Y,X);madre(Y,X)).

%hija(x,y):x es hija de y
hija(X,Y):-mujer(X),(padre(Y,X);madre(Y,X)).

%hermano(x,y): x es hermano de y
hermano(X,Y):-padre(Z,X),padre(Z,Y),madre(Z1,X),madre(Z1,Y),not(X=Y),varon(X).

%hermana
hermana(X,Y):-padre(Z,X),padre(Z,Y),madre(Z1,X),madre(Z1,Y),not(X=Y),mujer(X).


%sobrino(X,Y) : X ES SOBRINO DE Y
sobrino(X,Y):-hijo(X,P),(hermano(P,Y);hermana(P,Y)).

%sobrina (X,Y): X ES SOBRINA DE Y
% sobrina(X,Y):-hija(X,P),(hermano(P,Y);hermana(P,Y)),((madre(Y,HA),mujer(Y),padre(Z1,HA));(varon(Y),padre(Y,HB),madre(Z2,HB))).
sobrina(X,Y):-hija(X,P),(hermano(P,Y);hermana(P,Y)).


%tio(X,Y):x es tio de y
tio(X,Y):-varon(X),((padre(P,Y),hermano(X,P);madre(M,Y),hermano(X,M));(padre(X,M2),madre(AU,M2),(hermana(AU,M1),madre(M1,Y);hermana(AU,P1),padre(P1,Y)))).
%tio(X,hY):-varon(X),(sobrina(Y,X);sobrino(Y,X)).
%
tio(X,Y):-varon(X),(sobrina(Y,X);sobrino(Y,X)).


%tia
tia(X,Y):-mujer(X),((padre(P,Y),hermana(X,P);madre(M,Y),hermana(X,M));(madre(X,M2),padre(AU,M2),(hermano(AU,M1),madre(M1,Y);hermano(AU,P1),padre(P1,Y)))).
%primo(X,Y): X Es primo de Y
primo(X,Y):-(padre(Z,Y);madre(Z,X)),(padre(Z1,Y);madre(Z1,Y)),(hermana(Z,Z1);hermana(Z,Z1)),varon(X),diferente(X,Y).
%prima(X,Y): X Es prima de Y
prima(X,Y):-(padre(Z,Y);madre(Z,X)),(padre(Z1,Y);madre(Z1,Y)),(hermana(Z,Z1);hermana(Z,Z1)),mujer(X),diferente(X,Y).


%padrastro: X ES PADRASTRO DE Y
padrastro(X,Y):-not(hijo(Y,X);hija(Y,X)),padre(X,H),(madre(M,Y),madre(M,H)),varon(X),!.

%madrastra
madrastra(X,Y):-not(hijo(Y,X);hija(Y,X)),madre(X,H),(padre(P,Y),padre(P,H)),mujer(X),!.



%hermanastro(x,y):x es hermanastro de y
hermanastro(X,Y):-(((padre(P,X),padre(P,Y)),madre(M,X),madre(A,Y),not(M=A));(madre(M2,X),madre(M2,Y)),padre(P2,X),padre(A2,Y),not(P2=A2)),varon(X).

%hermanastra
hermanastra(X,Y):-(((padre(P,X),padre(P,Y)),madre(M,X),madre(A,Y),not(M=A));(madre(M2,X),madre(M2,Y)),padre(P2,X),padre(A2,Y),not(P2=A2)),mujer(X).

% ANCESTRO CASO BASE
ancestro(X,Y):-padre(X,Y).
ancestro(X,Y):-madre(X,Y).
ancestro(X,Y):-padre(X,Z),ancestro(Z,Y).
ancestro(X,Y):-madre(X,Z),ancestro(Z,Y).
%CASO RECUERRENTE
ancestro(X,Y):-(padre(X,Z);madre(X,Z)),ancestro(Z,Y).

%DESCENDIENTE
descendiente(X,Y):-ancestro(Y,X).

%hermanastra(X,Y):-(padre(Z,X);madre(Z,X)),(padre(Z,Y);madre(Z,Y)),not(X=Y),not(varon(Y)).























