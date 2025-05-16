#!/usr/bin/sh
# you have to set the world as non-transparent, i.e. by selecting an unused color as the transparent color.
convert assets/tiled_world_layers.gif -coalesce -compress none assets/tiled_world_layer_%02d.ppm # split gif to seperate frames
sed -i 's/\([0-9]\+\) \([0-9]\+\) \([0-9]\+\) /\1_\2_\3 /g' assets/tiled_world_layer_0* # join blocks of 3 numbers
sed -i 's/255_255_255/1/g' assets/tiled_world_layer_0* # turn white into tile 1
sed -i 's/255_0_0/2/g' assets/tiled_world_layer_0*
sed -i 's/0_255_0/3/g' assets/tiled_world_layer_0*
sed -i 's/0_0_255/4/g' assets/tiled_world_layer_0*
sed -i 's/0_0_0/0/g' assets/tiled_world_layer_0*
sed -i '1d' assets/tiled_world_layer_0* # delete first line
sed -i '2d' assets/tiled_world_layer_0* # delete third line
sed -i '1s/\([0-9]\+\) \([0-9]\+\)/int tileset_n\[\2\]\[\1\] = {/' assets/tiled_world_layer_0* # use height and width to make dimensions of array
sed -i '2,$s/^/{/' assets/tiled_world_layer_0* # make into array
sed -i '2,$s/ $/},/' assets/tiled_world_layer_0*
sed -i '$s/},/}};/' assets/tiled_world_layer_0*
sed -i '2,$s/ /,/g' assets/tiled_world_layer_0*

# move to c file TODO use bash to mv to c file before sed
cp assets/tiled_world_layer_00.ppm src/tilemap.c

