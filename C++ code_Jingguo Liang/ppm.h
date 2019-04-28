#ifndef PPM_H
#define PPM_H

#include <cstdio>
#include <cstdlib>

typedef struct
{
	unsigned char r;
	unsigned char g;
	unsigned char b;
} pixel;

typedef struct
{
	pixel* data;
	int height;
	int width;
} ppm_image;

int write(FILE* fp, const ppm_image* im);

#endif