#!/usr/bin/sh
convert assets/dual_grid_tiles_production.gif -crop 16x16+0+0 +repage assets/tileset1/outer_corner_0.gif
convert assets/dual_grid_tiles_production.gif -crop 16x16+16+0 +repage assets/tileset1/edge_connector_0.gif
convert assets/dual_grid_tiles_production.gif -crop 16x16+32+0 +repage assets/tileset1/inner_corner_0.gif
convert assets/dual_grid_tiles_production.gif -crop 16x16+0+16 +repage assets/tileset1/border_0.gif
convert assets/dual_grid_tiles_production.gif -crop 16x16+16+16 +repage assets/tileset1/overlay_fill_0.gif
convert assets/dual_grid_tiles_production.gif -crop 16x16+32+16 +repage assets/tileset1/underlay_fill_0.gif

convert -rotate 90 assets/tileset1/outer_corner_0.gif assets/tileset1/outer_corner_1.gif
convert -rotate 180 assets/tileset1/outer_corner_0.gif assets/tileset1/outer_corner_2.gif
convert -rotate 270 assets/tileset1/outer_corner_0.gif assets/tileset1/outer_corner_3.gif

convert -rotate 90 assets/tileset1/edge_connector_0.gif assets/tileset1/edge_connector_1.gif

convert -rotate 90 assets/tileset1/border_0.gif assets/tileset1/border_1.gif
convert -rotate 180 assets/tileset1/border_0.gif assets/tileset1/border_2.gif
convert -rotate 270 assets/tileset1/border_0.gif assets/tileset1/border_3.gif

convert -rotate 90 assets/tileset1/inner_corner_0.gif assets/tileset1/inner_corner_1.gif
convert -rotate 180 assets/tileset1/inner_corner_0.gif assets/tileset1/inner_corner_2.gif
convert -rotate 270 assets/tileset1/inner_corner_0.gif assets/tileset1/inner_corner_3.gif

