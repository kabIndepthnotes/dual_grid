
.DEFAULT_GOAL := production

# treat this as a make instruction and not a bash command
.PHONY := all clean dual_grid

CC_LINUX := gcc
CFLAGS := -std=c99 -Wall -W -pedantic -fanalyzer
CLIBS := -lraylib -lm -Iinclude/
HASLIT := $(shell command -v lit 2> /dev/null)

LOG := 2>&1|tee log.txt

CC_WIN := x86_64-w64-mingw32-gcc

NAME ?= indepthnotes

dual_grid: litify
	sed -i 1d src/gif_to_array.sh # remove first line comment
	sed -i 1d src/build_tileset.sh # remove first line comment
	@./src/gif_to_array.sh
	@./src/build_tileset.sh

collision_tiles: litify
	$(CC_LINUX) src/collision_tiles.c src/tilemap.c $(CFLAGS) -g $(CLIBS) -o debug/collision_tiles $(LOG)

test_col_tiles:
	$(CC_LINUX) test/rectangles.c $(CFLAGS) -g $(CLIBS) -o linux_build/rectangles $(LOG)

litify:
ifdef HASLIT
	lit --weave lit/main.lit --out-dir docs
	lit --tangle lit/main.lit --out-dir src
	lit --weave lit/collision_tiles.lit --out-dir docs
	lit --tangle lit/collision_tiles.lit --out-dir src
	lit --weave lit/dual_grid.lit --out-dir docs
	lit --tangle lit/dual_grid.lit --out-dir src
endif

debug: litify dual_grid collision_tiles test_col_tiles
	$(CC_LINUX) src/main.c src/tilemap.c $(CFLAGS) -g $(CLIBS) -o debug/main_debug $(LOG)

windows: litify dual_grid collision_tiles test_col_tiles
	$(CC_WIN) -o window_build/main.exe src/main.c -Iray_include/ -Iwindow_include ./window_include/libraylib.a -lgdi32 -lwinmm

linux: litify dual_grid collision_tiles test_col_tiles
	$(CC_LINUX) src/main.c src/tilemap.c $(CFLAGS) $(CLIBS) -o linux_build/main

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

source_code:
	zip source.zip main.c LICENSE Readme assets
