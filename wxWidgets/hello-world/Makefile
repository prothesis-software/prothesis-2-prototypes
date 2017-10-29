linux:
	mkdir -p build
	g++ src/HelloWorld.cpp `../src/gtk-shared-build/wx-config --libs --cxxflags` -o build/HelloWorld

win:
	mkdir -p build
	i686-w64-mingw32-g++ src/HelloWorld.cpp --static `../src/msw-static-build/wx-config --libs --cxxflags` -o build/HelloWorld.exe

clean:
	rm -f build/*
