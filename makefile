

default : ## build writer
	gcc -o finder-app/writer finder-app/writer.c

clean : ## remove writer and all *.o files
	@if [ -f find-app/writer ]; then\
		rm finder-app/writer;\
	fi
	@if [ -f finder-app/*.o ]; then\
		rm finder-app/*.o;\
	fi

CROSS_COMPILE :  ## cross compile writer
	export PATH=$PATH:$(pwd)/gcc-arm-10.3-2021.07-x86_64-aarch64-none-linux-gnu/bin
	aarch64-none-linux-gnu-gcc finder-app/writer.c -o finder-app/writer