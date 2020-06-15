%%% -------------------------------------------------------------------
%%% Author  : uabjle
%%% Description : kill and starts nodes and checks if the applications 
%%% still working
%%% 
%%% 
%%% Created : 10 dec 2012
%%% -------------------------------------------------------------------
-module(monkey_test).  
   
%% --------------------------------------------------------------------
%% Include files
%% --------------------------------------------------------------------
-include_lib("eunit/include/eunit.hrl").
-include("common_macros.hrl").

%% --------------------------------------------------------------------
-compile(export_all).



%% ====================================================================
%% External functions
%% ====================================================================

%% --------------------------------------------------------------------
%% Function:emulate loader
%% Description: requires pod+container module
%% Returns: non
%% --------------------------------------------------------------------
start()->
    ?assertEqual(ok,adder_test()),   
    
    ok.

%% --------------------------------------------------------------------
%% Function:emulate loader
%% Description: requires pod+container module
%% Returns: non
%% --------------------------------------------------------------------
adder_test()->
    case tcp_client:call(?DNS_ADDRESS,{dns_service,get,["adder_service"]}) of
	[]->
	    {error,[]};
	IpAddresses->
	    [{IpAddr,Port}|_]=IpAddresses,
	    ?assertEqual(42,tcp_client:call({IpAddr,Port},{adder_service,add,[20,22]})),
	    master_service:stop_unload("adder_service",IpAddr,Port),
	    ok
    end.
