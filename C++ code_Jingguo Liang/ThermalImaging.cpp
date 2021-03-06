#include <iostream>
#include <cstdlib>
#include "thermal.h"

int main()
{
	std::string file_name = "FLIR1.csv", output_name = "output.ppm";
	thermal_image image;
	image.read_csv(file_name);
	std::cout << "Width: " << image.width << std::endl << "Height: " << image.height << std::endl;
	image.write_ppm(output_name, 80, 110);
	system("pause");
	return 0;
}
