all:
	rm -rf *.info app_config catalog node_config  logfiles *_service include *~ */*~ */*/*~;
	rm -rf */*.beam;
	rm -rf *.beam erl_crash.dump */erl_crash.dump */*/erl_crash.dump;
	cp src/*.app ebin;
	erlc -o ebin src/*.erl;
doc_gen:
	rm -rf  node_config logfiles doc/*;
	erlc ../doc_gen.erl;
	erl -s doc_gen start -sname doc

git:
	rm -rf basic master_service dns_service log_service lib_service ../src/*~ test_ebin/* ../test_src/*~ ;
	git clone https://github.com/joq62/basic.git;
#	master_service
	cp -r basic/master_service .;	
	cp basic/master_service/src/*.app master_service/ebin;
	erlc -D local -I basic/include -o master_service/ebin master_service/src/*.erl;
#	lib_service
	cp -r basic/lib_service .;	
	cp basic/lib_service/src/*.app lib_service/ebin;
	erlc -D local -I basic/include -o lib_service/ebin lib_service/src/*.erl;
#	log_service
	cp -r basic/log_service .;	
	cp basic/log_service/src/*.app log_service/ebin;
	erlc -D local -I basic/include -o log_service/ebin log_service/src/*.erl;
#	dns_service
	cp -r basic/dns_service .;	
	cp basic/dns_service/src/*.app dns_service/ebin;
	erlc -D local -I basic/include -o dns_service/ebin dns_service/src/*.erl;
#	test
	erlc -D local -I basic/include -o test_ebin ../test_src/*.erl;
#	remove basic
	rm -rf basic;
	erl -pa master_service/ebin -pa log_service/ebin -pa lib_service/ebin -pa dns_service/ebin  -pa test_ebin -s master_service_tests start -sname pod_master

master:
	rm -rf *_service include ebin/* test_ebin/* test_src/*~ src/*~ erl_crasch.dump;
#	orchistrate_service
	cp -r /home/pi/erlang/erl_infra/orchistrate_service .;
	cp /home/pi/erlang/erl_infra/orchistrate_service/src/*.app orchistrate_service/ebin;
	erlc -I /home/pi/erlang/erl_infra/include -o orchistrate_service/ebin orchistrate_service/src/*.erl;
#	iaas_service
	cp -r /home/pi/erlang/erl_infra/iaas_service .;
	cp /home/pi/erlang/erl_infra/iaas_service/src/*.app iaas_service/ebin;
	erlc -I /home/pi/erlang/erl_infra/include -o iaas_service/ebin iaas_service/src/*.erl;
#	catalog_service
	cp -r /home/pi/erlang/erl_infra/catalog_service .;
	cp /home/pi/erlang/erl_infra/catalog_service/src/*.app catalog_service/ebin;
	erlc -I /home/pi/erlang/erl_infra/include -o catalog_service/ebin catalog_service/src/*.erl;
#	boot_service
	cp src/*.app ebin;
	erlc -I ../include -o ebin src/*.erl;	
#	test
	erlc -D master -I /home/pi/erlang/erl_infra/include -o test_ebin test_src/*.erl;
	erl -pa */ebin -pa ebin -pa test_ebin -boot_service num_services 3 -boot_service services orchistrate_serviceXcatalog_serviceXiaas_service -s boot_service_tests start -sname master_boot_test
worker:
	rm -rf *.info catalog *_service ebin/* test_ebin/* test_src/*~ src/*~ erl_crasch.dump;
	git clone https://github.com/joqerlang/catalog.git;
	cp catalog/dns_test.info .;
	rm -rf catalog;
	cp src/*.app ebin;
	erlc -D test -o  ebin src/*.erl;	
#	test
	erlc -D worker -D test -o test_ebin test_src/*.erl;
	erl -pa */ebin -pa ebin -pa test_ebin -s boot_service_tests start -sname worker_boot_test
