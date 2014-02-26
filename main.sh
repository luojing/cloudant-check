#!/usr/bin/env escript
%% -*- erlang -*-
%%! -smp enable -sname factorial -mnesia debug verbose

-define(AccountFile,"account.txt").

main([]) ->
	code:add_path("ebin"),
	couchbeam:start(),
	%appmon:start(),{ok, IoDevice}
	%io:format("code path: ~p \n",[code:get_path()]),

	{ok, File}=file:open(?AccountFile,[read]),
	read_account(File),
	file:close(File).

read_account(File) ->
	case file:read_line(File) of
		{ok,Data} ->
			Data1=re:replace(Data, "\\n", "", [global,{return,list}]),
			[Cluster,Account,Password]=string:tokens(Data1," "),
			Host=Account++".cloudant.com",
			Port=443,
			Options=[{connect_timeout, 10000},{inactivity_timeout, 10000},{basic_auth, {Account, Password}},{is_ssl, true}],
			health:start_monitor(Cluster, Account, Password, Host, Port, "", Options),
			%Pid=spawn_link(health,start_monitor,[Cluster, Account, Password, Host, Port, "", Options]),
			%io:format("~p pid:~p ~n",[Account,Pid]),
			read_account(File);
		eof ->
			io:format("end file ~n",[])
	end.

