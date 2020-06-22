all:
	rm -rf *_service  *_config catalog erl_crasch.dump;
#	boot_service
	git clone https://github.com/joqerlang/boot_service.git;	
	cp boot_service/src/*.app boot_service/ebin;
	erlc -D test -o boot_service/ebin boot_service/src/*.erl;
#	test_agent
	cp ../test_agent/src/*.app ../test_agent/ebin;
	erlc -o ../test_agent/ebin ../test_agent/src/*.erl;
	erl -pa ../test_agent/ebin -pa */ebin -test_agent type worker -s test_agent boot -sname dmz_sthlm_1
