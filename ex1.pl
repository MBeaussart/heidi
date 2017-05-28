
% list of whistle
whistle(court).
whistle(who).
whistle(wheet).
whistle(long).
whistle(whee).
whistle(hee).
whistle(wheeo).
% find them with whistle(X).

% list order
order(deponer).
order(dretg).
order(davent).
order(plaun).
order(sanester).
order(returnar).
order(safermar).
order(davos).
% list of them find with order(X).

% translation
translation(deponer, [court, court]).
translation(davos, [who, hee, who]).
translation(safermar, [long]).
translation(plaun, [hee, hee, hee, hee]).
translation(sanester, [wheet, wheeo]).
translation(davent, [wheet, wheeo, wheet, wheet]).
translation(returnar, [whee, whee, wheet]).
translation(dretg, [whee, who ]).
% find combinaison translation(X, Y).


pause(pause).

% first case
translate([], []).
% second case
% translation first element and the rest recursivly
translate([H | T], Y):- 	translation(H, H_translationd),
   				   				translate(T, T_translationd),
    								T_var = [Pause | T_translationd],
    								pause(Pause),
    								append(H_translationd, T_var, Y).



% test translate([A], X). OR translate([A, B, C], X).

/* tests */
% tests true
/*
  translate([deponer, safermar], [court, court, pause, long, pause]).
  translate([plaun, dretg], [hee, hee, hee, hee, pause, whee, who, pause]).
 */

% tests false
/*
  translate([deponer, safermar], [court, whee, pause, court, pause]).
  translate([plaun, dretg], [hee, whee, hee, hee, pause, whee, whee, pause]).
*/
