
.DEFAULT_GOAL := debug

# treat this as a make instruction and not a bash command
.PHONY := all clean giftotileset

CC_LINUX := gcc
CFLAGS := -std=c99 -Wall -W -pedantic -fanalyzer
CLIBS := -lraylib -lm -Iinclude/

LOG := 2>&1|tee log.txt

CC_WIN := x86_64-w64-mingw32-gcc

NAME ?= indepthnotes

giftotileset:
	lit --weave lit/giftotileset.lit --out-dir doc
	lit --tangle lit/giftotileset.lit --out-dir src
	sed -i 1d src/giftotileset.sh # remove first line comment
	sed -i 1d src/rotate_gif.sh # remove first line comment

collision_tiles: litify
	$(CC_LINUX) src/collision_tiles.c src/tilemap.c $(CFLAGS) -g $(CLIBS) -o debug/collision_tiles $(LOG)

test-col-tiles:
	$(CC_LINUX) test/rectangles.c $(CFLAGS) -g $(CLIBS) -o test/rectangles.o $(LOG)

litify:
	lit --weave lit/main.lit --out-dir doc
	lit --tangle lit/main.lit --out-dir src
	lit --weave lit/collision_tiles.lit --out-dir doc
	lit --tangle lit/collision_tiles.lit --out-dir src


debug: litify
	$(CC_LINUX) src/main.c src/tilemap.c $(CFLAGS) -g $(CLIBS) -o debug/main_debug $(LOG)

windows: litify
	$(CC_WIN) -o window_build/main.exe src/main.c -Iray_include/ -Iwindow_include ./window_include/libraylib.a -lgdi32 -lwinmm

linux: litify
	$(CC_LINUX) src/main.c $(CFLAGS) $(CLIBS) -o linux_build/main

web: litify
	emcc -o web_build/index.html src/main.c -Os -Wall -Isrc/tilemap.h -Iray_include/ -Iweb_include --preload-file assets/ -s TOTAL_MEMORY=67108864 -s FORCE_FILESYSTEM=1 -s ASSERTIONS=1 --profiling --shell-file web_include/minshell.html ./web_include/libraylib.web.a -sUSE_GLFW=3 $(LOG)
	# run a webserver! e.g. python3 -m http.server

clean:
	rm debug/main_debug
	rm window_build/main.exe
	rm linux_build/main
	rm web_build/main.html web_build.main.js

itch:
	zip $(NAME).zip web_build/*

source-code:
	zip source.zip main.c LICENSE Readme assets
