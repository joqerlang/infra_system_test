%% This is the application resource file (.app file) for the 'base'
%% application.
{application, test_agent,
[{description, "test_agent" },
{vsn, "1.0.0" },
{modules, 
	  [test_agent_app,test_agent_sup,test_agent]},
{registered,[test_agent]},
{applications, [kernel,stdlib]},
{mod, {test_agent_app,[]}},
{start_phases, []}
]}.
