.PHONY: clean

all: module
	# Backup original dylib
	mv libModule.dylib _libModule.dylib
	
	# create mock swiftdoc and swiftmodule files
	swiftc -emit-library -emit-module Module.swift -o libModule.dylib
	
	# restore original dylib
	mv _libModule.dylib libModule.dylib
	
	# compile the program and link against the real library
	swiftc -I. -L. -lModule main.swift

module:
	swiftc -emit-library RealModule.swift -o libModule.dylib


clean:
	rm -f *.dylib *.swiftdoc *.swiftmodule
	rm -f main
