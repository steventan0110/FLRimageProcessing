#include "ppm.h"

int write(FILE * fp, const ppm_image * im)
{
	fprintf(fp, "P6\n%d %d\n255\n", (*im).width, (*im).height);
	int num_written;
	num_written = fwrite((*im).data, sizeof(pixel), (*im).height * (*im).width, fp);
	if (num_written != (*im).height * (*im).width)
		return -1;
	return num_written;
}
