# invoke SourceDir generated makefile for empty_min.pem4f
empty_min.pem4f: .libraries,empty_min.pem4f
.libraries,empty_min.pem4f: package/cfg/empty_min_pem4f.xdl
	$(MAKE) -f /Users/ElmerOMejia/Desktop/CPE403/empty_min_EK_TM4C123GXL_TI/src/makefile.libs

clean::
	$(MAKE) -f /Users/ElmerOMejia/Desktop/CPE403/empty_min_EK_TM4C123GXL_TI/src/makefile.libs clean

