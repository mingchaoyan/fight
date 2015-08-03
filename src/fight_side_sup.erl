%%%-------------------------------------------------------------------
%%% @author mingchaoyan@gmail.com
%%% @copyright 2015 mingchaoyan
%%% @doc
%%%
%%% @end
%%%-------------------------------------------------------------------

-module(fight_side_sup).

-behaviour(supervisor).

%% API
-export([start_link/1]).

%% Supervisor callbacks
-export([init/1]).

-define(CHILD(Id, Mod, Type, Args), {Id, {Mod, start_link, Args},
                                     permanent, 5000, Type, [Mod]}).

%%%===================================================================
%%% API functions
%%%===================================================================

%%--------------------------------------------------------------------
%% @doc
%% Starts the supervisor
%%
%% @spec start_link() -> {ok, Pid} | ignore | {error, Error}
%% @end
%%--------------------------------------------------------------------
start_link(Name) ->
    supervisor:start_link({local, Name}, ?MODULE, [Name]).

%%%===================================================================
%%% Supervisor callbacks
%%%===================================================================

%%--------------------------------------------------------------------
%% @private
%% @doc
%% Whenever a supervisor is started using supervisor:start_link/[2,3],
%% this function is called by the new process to find out about
%% restart strategy, maximum restart frequency and child
%% specifications.
%%
%% @spec init(Args) -> {ok, {SupFlags, [ChildSpec]}} |
%%                     ignore |
%%                     {error, Reason}
%% @end
%%--------------------------------------------------------------------
init([Name]) ->
    ChildrenList = case Name of
                       fight_attacker_sup ->
                           [?CHILD(attacker_1, fight_unit, worker, 
                                   [attacker_1, data:g(attacker_1)]), 
                            ?CHILD(attacker_2, fight_unit, worker, 
                                   [attacker_2, data:g(attacker_2)])
                           ];
                       fight_defenser_sup ->
                           [?CHILD(defenser_1, fight_unit, worker, 
                                   [defenser_1, data:g(defenser_1)]), 
                            ?CHILD(defenser_2, fight_unit, worker, 
                                   [defenser_2, data:g(defenser_2)])
                           ]
                   end,
    {ok, {{one_for_one, 5, 10}, ChildrenList}}.

%%%===================================================================
%%% Internal functions
%%%===================================================================
