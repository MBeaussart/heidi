% list of whistle
whistle(hee).
whistle(wheet).
whistle(wheeo).


% list order
order(deponer).
order(returnar).
order(sanester).
order(davent).
order(davos).
order(safermar).
order(plaun).
order(dretg).

% translate
translation(deponer, [wheeo, hee, wheet]).
translation(dretg, [hee, wheet]).
translation(sanester, [wheet, wheeo]).
translation(davent, [wheet, hee, wheet]).
translation(davos, [wheet, wheeo, wheet]).
translation(plaun, [wheet, wheeo, wheeo]).
translation(returnar, [wheeo, wheet]).
translation(safermar, [wheeo, wheeo]).


/* translate from Tita */
% first case
translate_from_heidi([], []).

% case one element
translate_from_heidi(X, Y):- X = [L],translation(L, Y).

% case more than one element, first we translate the first element and recursivly the rest
translate_from_heidi([H | T], Y):- translation(H, H_translated), translate_from_heidi(T, T_translated), append(H_translated, T_translated, Y).

translate_from_tita([], []).
% two whistle orders
translate_from_tita(X, Y):- X = [A | B], % we take the first element
    			B =  [C | D], % and the second
    			translate_from_tita(D, Restesol), % solve
    			translation(Sol, [A , C]),
    			Y = [Sol | Restesol].

% three whistle orders
translate_from_tita(X, Y):- X = [A | B], % we take the first element
    			B =  [C | D], % and the second
    			D =  [E | F], % and the third
    			translate_from_tita(F, Restesol), % solve
      			translation(Sol, [A , C, E]),
    			Y = [Sol | Restesol].



% tests
/*
  % true
  translate_from_tita( [wheeo, hee, wheet, wheeo, wheeo], [deponer,  safermar]).
  translate_from_tita( [wheeo, hee, wheet, wheeo, wheeo, wheet, hee, wheet], [deponer,  safermar, davent]).
  % false
   translate_from_tita( [wheeo, wheeo, wheeo], [deponer,  safermar]).
  translate_from_tita(  [wheeo, wheeo, wheet, hee, wheet, wheeo, hee, wheet], [  safermar, deponer, davent]).

	% translate
	translate_from_heidi([dretg, plaun, davent, sanester], X).
	% translate 2
	translate_from_tita([ hee, wheet, wheet, wheeo, wheeo, wheeo, hee, wheet, wheeo, wheeo, wheet, wheeo, wheeo], X).
*/
