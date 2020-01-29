docker:
	chmod a+x sorer
	echo "Nothing to build, as we use Python. All good."

run: docker
	./sorer -f "default.sor" -from 0 -len 100 -print_col_type 0

test: docker
	-./sorer -f "default.sor" -from 0 -len 100 -print_col_type 0
	-./sorer -f "default.sor" -from 0 -len 100 -print_col_type 2
	-./sorer -f "default.sor" -from 0 -len 100 -is_missing_idx 2 0
	-./sorer -f "default.sor" -from 0 -len 100 -is_missing_idx 2 1
	-./sorer -f "default.sor" -from 0 -len 100 -is_missing_idx 2 2
	-./sorer -f "default.sor" -from 0 -len 100 -print_col_idx 2 0
	-./sorer -f "default.sor" -from 5 -len 100 -print_col_idx 1 0
	-./sorer -f "testfile.sor" -from 0 -len 100 -print_col_type 0
	-./sorer -f "testfile.sor" -from 0 -len 100 -print_col_type 2
	-./sorer -f "testfile.sor" -from 0 -len 100 -print_col_type 1
	-./sorer -f "testfile.sor" -from 0 -len 100 -print_col_type 3
	-./sorer -f "testfile.sor" -from 5 -len 100 -print_col_type 0
	-./sorer -f "testfile.sor" -from 0 -len 100 -print_col_idx 0 1
	-./sorer -f "testfile.sor" -from 0 -len 100 -print_col_idx 2 2
	-./sorer -f "testfile.sor" -from 0 -len 100 -print_col_idx 3 0
	-./sorer -f "testfile.sor" -from 0 -len 100 -print_col_idx 1 2
	-./sorer -f "testfile.sor" -from 5 -len 100 -print_col_idx 1 0
	-./sorer -f "testfile.sor" -from 0 -len 100 -is_missing_idx 3 1
	-./sorer -f "testfile.sor" -from 0 -len 100 -is_missing_idx 3 2
	-./sorer -f "testfile.sor" -from 0 -len 100 -is_missing_idx 1 1
	-./sorer -f "testfile.sor" -from 5 -len 100 -is_missing_idx 1 1
	-./sorer -f "testfile.sor" -from 0 -len 100 -print_col_idx 2 0
	-./sorer -f "testfile.sor" -from 0 -len 2 -print_col_idx 2 0
	-./sorer -f "testfile.sor" -from 19 -len 20 -print_col_idx 3 0
	-./sorer -f "changingschema.sor" -print_col_idx 1 500
	-./sorer -f "testfile.sor" -print_col_idx 3 0 -is_missing_idx 3 1
	-./sorer -f "testfile.sor" -print_col_idx 3 0 -is_missing_idx 3 1 -print_col_type 0
	-./sorer -f "changingschema.sor" -print_col_idx 1 500
	-./sorer -f "spacey.sor" -print_col_idx 3 0
	-./sorer -f "spacey.sor" -print_col_idx 2 0
	-./sorer -f "spacey.sor" -print_col_type 2
	-./sorer -f "spacey.sor" -print_col_type asdljfaklsdf
	-./sorer -f "spacey.sor" -print_col_idx 2
	-./sorer -f "spacey.sor" -print_col_idx asdfasdf asdfasd
	-./sorer -f "spacey.sor" -print_col_idx 2 asdfasd

clean:
	echo "Nothing to clean, as we use Python. All good."