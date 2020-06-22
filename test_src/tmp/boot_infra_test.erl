%%% -------------------------------------------------------------------
%%% Author  : uabjle
%%% Description : dbase using dets 
%%% 
%%% Created : 10 dec 2012
%%% -------------------------------------------------------------------
-module(boot_infra_test).  
   
%% --------------------------------------------------------------------
%% Include files
%% --------------------------------------------------------------------
-include_lib("eunit/include/eunit.hrl").


%% --------------------------------------------------------------------
-export([start/0,stop/0]).



%% ====================================================================
%% External functions
%% ====================================================================

%% --------------------------------------------------------------------
%% Function:emulate loader
%% Description: requires pod+container module
%% Returns: non
%% --------------------------------------------------------------------
start()->
    do_make("master_sthlm_1",master_sthlm_1@asus),
    ok.


stop()->
    rpc:call(master_sthlm_1@asus,init,stop,[]).

%% --------------------------------------------------------------------
%% Function:emulate loader
%% Description: requires pod+container module
%% Returns: non
%% --------------------------------------------------------------------
do_make(Path,Node)->
    []=os:cmd("cd "++Path),
    io:format("~p~n",[{?MODULE,?LINE,os:cmd("make &")}]),
    
    pong=net_adm:ping(Node).
