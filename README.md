If you would like to use this code in your projects, it is strongly recommended (but it is not required) that you have donated at least £0.50 to indepthnotes, either through youtube superthanks, the buymeacoffeelink, or the various other methods (indepthnotes.com/donate).

# prerequistes
- for windows compiling you need a cross-compiler such as gcc-mingw-w64-x86-64
- for web builds you will need to compile raylib to work with web. To do this you need emscripten.
- you need a regular raylib.h headerfile compiled for everything else.
- I follow the literate programming style, and use https://github.com/zyedidia/Literate . This is not necessary and you simply have to change the MAKEFILE accordingly.

# windows cross compile
- The steps are similar to compiling raylib for linux, but you must supply some flags
`make PLATFORM=PLATFORM_DESKTOP CC=x86_64-w64-mingw32-gcc PLATFORM_OS=WINDOWS`

# web compiling
- as of Thursday 6 Mar 2025 the commandline compilation of the web build ( https://github.com/raysan5/raylib/wiki/Working-for-Web-(HTML5)#21-command-line-compilation ) does not work, I recommend using the command below
- `make PLATFORM=PLATFORM_WEB # To make web version.`


# Donations and Support
see https://indepthnotes.com/donate

If this code was of use to you, please consider donating to indepthnotes.

Buy me a Coffee buymeacoffee.com/indepthnotes

Send me Monero, My address is: 43Q7GUmbhRTiqLGCaEXgwRPDQMvkEqADKQuG7VBfbnYNGdrjVU7ZUhaa5sLxZYKGbH3Hrcax9kKxp72exX4wRunhRBBHBns

Send me Bitcoin, My address is: bc1qepemmagg5k47z8sr62tnk9we3hr5fwslyhmhh2
