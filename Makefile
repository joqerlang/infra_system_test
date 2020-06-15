all:
	rm -rf ebin/* src/*~;
	erlc -o ebin src/*.erl;
	cp src/*.app ebin;
	erl -pa ebin -s node_controller_service start -sname node_controller_service
master:
	rm -rf *_service include ebin/* test_ebin/* test_src/*~ src/*~ erl_crasch.dump;
#	orchistrate_service
	git clone https://github.com/joqerlang/orchistrate_service.git .;
	cp orchistrate_service/src/*.app orchistrate_service/ebin;
	erlc -o orchistrate_service/ebin orchistrate_service/src/*.erl;
#	iaas_service
	git clone https://github.com/joqerlang/iaas_service.git .;
	cp iaas_service/src/*.app iaas_service/ebin;
	erlc -o iaas_service/ebin iaas_service/src/*.erl;
#	catalog_service
	git clone https://github.com/joqerlang/catalog_service.git .;	
	cp catalog_service/src/*.app catalog_service/ebin;
	erlc -o catalog_service/ebin catalog_service/src/*.erl;
#	boot_service
	git clone https://github.com/joqerlang/boot_service.git .;	
	cp boot_service/src/*.app boot_service/ebin;
	erlc -o boot_service/ebin boot_service/src/*.erl;	
	erl -pa */ebin -boot_service num_services 3 -boot_service services orchistrate_serviceXcatalog_serviceXiaas_service -s boot_service boot -sname master_sthlm_1
#
#	Worker
worker:
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
	git clone https://github.com/joqerlang/boot_service.git .;	
	cp boot_service/src/*.app boot_service/ebin;
	erlc -o boot_service/ebin boot_service/src/*.erl;
	erl -pa */ebin -s boot_service boot -sname change
