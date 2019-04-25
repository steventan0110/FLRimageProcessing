#ifndef THERMAL_H
#define THERMAL_H

#include <vector>
#include <string>
#include <iostream>
#include <fstream>
#include <sstream>
#include <cstdio>
#include <cstdlib>
#include "ppm.h"

class thermal_image {
public:
	size_t width;
	size_t height;
	std::vector<std::vector<double>> *image;

	thermal_image()
	{
		width = 0;
		height = 0;
		image = nullptr;
	}

	~thermal_image()
	{
		delete image;
	}

	void read_csv(std::string& file_name);
	void print_value() const;
	void write_ppm(std::string& file_name, double lower_bound, double upper_bound) const;
};

#endif
