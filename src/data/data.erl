%%%-------------------------------------------------------------------
%%% @author mingchaoyan@gmail.com
%%% @copyright 2015 mingchaoyan
%%% @doc
%%%
%%% @end
%%%-------------------------------------------------------------------

-module(data).

-export([g/1
         ]).

-include("fight.hrl").

g(attacker_1) ->
    #fight_unit_state{
       order = 1,
       hp = 100,
       attack = 20,
       defense = 20
      };
g(attacker_2) ->
    #fight_unit_state{
       order = 3,
       hp = 100,
       attack = 20,
       defense = 20
      };
g(defenser_1) ->
    #fight_unit_state{
       order = 2,
       hp = 100,
       attack = 20,
       defense = 20
      };
g(defenser_2) ->
    #fight_unit_state{
       order = 4,
       hp = 100,
       attack = 20,
       defense = 20
      }.
