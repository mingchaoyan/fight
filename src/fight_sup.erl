-module(fight_sup).

-behaviour(supervisor).

%% API
-export([start_link/0]).

%% Supervisor callbacks
-export([init/1]).

%% Helper macro for declaring children of supervisor
-define(CHILD(Id, Mod, Type, Args), {Id, {Mod, start_link, Args},
                                     permanent, 5000, Type, [Mod]}).

-include("fight.hrl").

%% ===================================================================
%% API functions
%% ===================================================================

start_link() ->
    %%gen_server:start_link({local, fight_sup_d }, fight_sup_d, [], []),
    fight_sup_d:start_link(),
    supervisor:start_link({local, ?MODULE}, ?MODULE, []).

%% ===================================================================
%% Supervisor callbacks
%% ===================================================================

init([]) ->
    {ok, {{one_for_one, 5, 10}, 
           [?CHILD(fight_attacker_sup, fight_side_sup, supervisor, 
                   [fight_attacker_sup]),
            ?CHILD(fight_attacker_sup_d, fight_side_sup_d, worker, 
                   [fight_attacker_sup_d, #fight_side_state{}]),
            ?CHILD(fight_defenser_sup, fight_side_sup, supervisor,
                   [fight_defenser_sup]),
            ?CHILD(fight_defenser_sup_d, fight_side_sup_d, worker, 
                   [fight_defenser_sup_d, #fight_side_state{}])
           ]}}.
