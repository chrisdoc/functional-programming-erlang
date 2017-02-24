
%%%_* Module declaration ===============================================
-module(submission_week1_test).

%%%_* Includes =========================================================
-include_lib("eunit/include/eunit.hrl").

within_in_delta(Expected, Actual, Delta) ->
  (Actual > (Expected - Delta)) and (Actual < (Expected + Delta)).

assert_in_delta_test_() ->
  [?_assert(within_in_delta(10, 9.9, 0.11)),
  ?_assert(within_in_delta(10, 10.1, 0.11)),
  ?_assertNot(within_in_delta(10, 9.9 ,0.05)),
  ?_assertNot(within_in_delta(10, 10.1 ,0.05))].

perimeter_rectangle_test_() ->
  [?_assert(submission_week1:perimeter({rectangle, {10,20}}) =:= 60),
  ?_assert(submission_week1:perimeter({rectangle, {20,10}}) =:= 60),
  ?_assert(submission_week1:perimeter({rectangle, {50,50}}) =:= 200),
  ?_assert(submission_week1:perimeter({rectangle, {0,20}}) =:= 40)
  ].

perimeter_triangle_test_() ->
  [?_assert(submission_week1:perimeter({triangle, {20,30,40}}) =:= 90),
  ?_assert(submission_week1:perimeter({triangle, {20,20,10}}) =:= 50),
  ?_assert(submission_week1:perimeter({triangle, {10,10,10}}) =:= 30),
  ?_assert(submission_week1:perimeter({triangle, {1,20,20}}) =:= 41)
  ].

perimeter_square_test_() ->
  [?_assert(submission_week1:perimeter({square, 10}) =:= 40),
  ?_assert(submission_week1:perimeter({square, 20}) =:= 80),
  ?_assert(submission_week1:perimeter({square, 50}) =:= 200),
  ?_assert(submission_week1:perimeter({square, 0}) =:= 0)
  ].

perimeter_circle_test_() ->
  [?_assert(within_in_delta(62.83, submission_week1:perimeter({circle, 10}), 0.1)),
  ?_assert(within_in_delta(31.42, submission_week1:perimeter({circle, 5}), 0.1))
  ].

area_rectangle_test_() ->
  [?_assert(submission_week1:area({rectangle, {10,20}}) =:= 200),
  ?_assert(submission_week1:area({rectangle, {20,10}}) =:= 200),
  ?_assert(submission_week1:area({rectangle, {50,50}}) =:= 2500),
  ?_assert(submission_week1:area({rectangle, {0,20}}) =:= 0)
  ].

area_triangle_test_() ->
  [?_assert(within_in_delta(290.47, submission_week1:area({triangle, {20,30,40}}), 0.1)),
  ?_assert(within_in_delta(96.82, submission_week1:area({triangle, {20, 20, 10}}), 0.1)),
  ?_assert(within_in_delta(43.30, submission_week1:area({triangle, {10 ,10, 10}}), 0.1)),
  ?_assert(within_in_delta(9.99, submission_week1:area({triangle, {1 ,20, 20}}), 0.1))
  ].

area_square_test_() ->
  [?_assert(submission_week1:area({square, 10}) =:= 100),
  ?_assert(submission_week1:area({square, 20}) =:= 400),
  ?_assert(submission_week1:area({square, 50}) =:= 2500),
  ?_assert(submission_week1:area({square, 0}) =:= 0)
  ].

area_circle_test_() ->
  [?_assert(within_in_delta(100*3.1415, submission_week1:area({circle, 10}), 0.1)),
  ?_assert(within_in_delta(25*3.1415, submission_week1:area({circle, 5}), 0.1))
  ].

enclose_rectangle_test_() ->
  [?_assert(submission_week1:enclose({rectangle, {10,20}}) =:= {rectangle, {10,20}}),
  ?_assert(submission_week1:enclose({rectangle, {20,10}}) =:= {rectangle, {20,10}}),
  ?_assert(submission_week1:enclose({rectangle, {50,50}}) =:= {rectangle, {50,50}}),
  ?_assert(submission_week1:enclose({rectangle, {0,20}}) =:= {rectangle, {0,20}})
  ].

% Need to figure out how to compare rectangle with a delta
% enclose_triangle_test_() ->
%   [?_assert(submission_week1:perimeter({triangle, {20,30,40}}) =:= 90),
%   ?_assert(submission_week1:perimeter({triangle, {20,20,10}}) =:= 50),
%   ?_assert(submission_week1:perimeter({triangle, {10,10,10}}) =:= 30),
%   ?_assert(submission_week1:perimeter({triangle, {1,20,20}}) =:= 41)
%   ].

enclose_square_test_() ->
  [?_assert(submission_week1:enclose({square, 10}) =:= {rectangle, {10,10}}),
  ?_assert(submission_week1:enclose({square, 20}) =:= {rectangle, {20,20}}),
  ?_assert(submission_week1:enclose({square, 50}) =:= {rectangle, {50,50}}),
  ?_assert(submission_week1:enclose({square, 0}) =:= {rectangle, {0,0}})
  ].

enclose_circle_test_() ->
  [?_assert(submission_week1:enclose({circle, 10}) =:= {rectangle, {20, 20}}),
  ?_assert(submission_week1:enclose({circle, 5}) =:= {rectangle, {10, 10}})
  ].

bits_test_() ->
  [?_assert(submission_week1:bits(7) =:= 3),
	?_assert(submission_week1:bits(8) =:= 1),
	?_assert(submission_week1:bits(3) =:= 2),
	?_assert(submission_week1:bits(15) =:= 4),
	?_assert(submission_week1:bits(42) =:= 3)
  ].