/* Name: rectangles.c */
/* Purpose: figure out if collision rect makes the right tiles */
/* Author: kab@indepthnotes.com */
/* Donate! indepthnotes.com/donate */
#include "raylib.h"
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

	int
main(void)
{
	InitWindow(1280, 1024, "test");

Rectangle rects[] =
{
(Rectangle) {128,64,160,32},
(Rectangle) {1120,64,160,96},
(Rectangle) {256,96,32,32},
(Rectangle) {1056,96,64,64},
(Rectangle) {224,128,32,32},
(Rectangle) {1024,128,32,32},
(Rectangle) {192,160,32,32},
(Rectangle) {160,192,32,64},
(Rectangle) {128,224,32,32},
(Rectangle) {192,224,96,32},
(Rectangle) {960,320,128,128},
(Rectangle) {32,352,192,160},
(Rectangle) {1088,352,32,64},
(Rectangle) {224,384,256,160},
(Rectangle) {480,416,32,128},
(Rectangle) {512,448,64,128},
(Rectangle) {576,480,32,96},
(Rectangle) {736,480,160,64},
(Rectangle) {1184,480,64,192},
(Rectangle) {64,512,160,32},
(Rectangle) {608,512,32,64},
(Rectangle) {1120,512,64,192},
(Rectangle) {160,544,128,32},
(Rectangle) {768,544,128,32},
(Rectangle) {1088,672,32,32},
(Rectangle) {1184,672,32,32},
};
	int n_rects = sizeof(rects)/sizeof(rects[0]);
	while (!WindowShouldClose())
	{
		BeginDrawing();
		ClearBackground(RAYWHITE);
		for (int i = 0; i < n_rects; i++) {
			DrawRectangleRec(rects[i], ColorFromHSV(i*(360/n_rects),1,1));
		}
		EndDrawing();
	}

	CloseWindow();
	return 0;
}
