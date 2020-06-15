master:
	rm -rf *_service  *_config catalog erl_crasch.dump;
#	orchistrate_service
	git clone https://github.com/joqerlang/orchistrate_service.git;
	cp orchistrate_service/src/*.app orchistrate_service/ebin;
	erlc -o orchistrate_service/ebin orchistrate_service/src/*.erl;
#	iaas_service
	git clone https://github.com/joqerlang/iaas_service.git;
	cp iaas_service/src/*.app iaas_service/ebin;
	erlc -o iaas_service/ebin iaas_service/src/*.erl;
#	catalog_service
	git clone https://github.com/joqerlang/catalog_service.git;	
	cp catalog_service/src/*.app catalog_service/ebin;
	erlc -o catalog_service/ebin catalog_service/src/*.erl;
#	boot_service
	git clone https://github.com/joqerlang/boot_service.git;	
	cp boot_service/src/*.app boot_service/ebin;
	erlc -o boot_service/ebin boot_service/src/*.erl;	
	erl -pa */ebin -boot_service num_services 3 -boot_service services orchistrate_serviceXcatalog_serviceXiaas_service -s boot_service boot -sname master_sthlm_1
