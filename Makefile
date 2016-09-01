.PHONY: build test local show_types lint

build:
	moonc pgmoon-mashape

test: build
	busted -v

local: build
	luarocks make --local

show_types:
	psql -U postgres -c "select oid, typname, typcategory, typelem from pg_type where typcategory in ('A', 'B', 'N', 'D', 'S');"

lint:
	moonc -l pgmoon-mashape
