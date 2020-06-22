all:
	rm -rf test_ebin/* test_src/*~;
	erlc -o test_ebin test_src/*.erl;
	erl -pa test_ebin -s boot_infra_test start -sname infra_test
