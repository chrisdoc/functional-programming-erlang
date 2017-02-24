-module(submission_week1).
-export([area/1,bits/1,enclose/1,perimeter/1]).

pi() -> 3.1415926535897932.

perimeter({rectangle, {W,H}}) ->
  2*(W+H);
perimeter({triangle, {A,B,C}}) ->
  A+B+C;
perimeter({square, A}) ->
  4*A;
perimeter({circle, R}) ->
  2*pi()*R.

area({rectangle, {W,H}}) ->
  W*H;
area({triangle, {A, B, C}}) ->
	S = (A + B + C)/2,
	math:sqrt(S*(S-A)*(S-B)*(S-C));
area({square, A}) ->
  A*A;
area({circle, R}) ->
  math:pi()*R*R.

enclose({rectangle, {W,H}}) ->
  {rectangle, {W,H}};
enclose({triangle, {A, B, C}}) ->
	W = max(A,max(B,C)), % Calculate largest side 
  H = 2*area({triangle, {A, B, C}}) / W, % Calculate the height
  {rectangle, {W,H}};
enclose({square, A}) ->
  {rectangle, {A,A}};
enclose({circle, R}) ->
  {rectangle, {2*R, 2*R}}.

bits(0,P) ->
  P;
bits(N,P) ->
  bits(N div 2,P + N rem 2).

bits(N) -> 
  bits(N,0).
