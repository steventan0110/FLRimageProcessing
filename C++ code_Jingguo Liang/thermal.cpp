#include "thermal.h"

using std::vector;

void thermal_image::read_csv(std::string& file_name)
{
	std::fstream fs;
	fs.open(file_name, std::fstream::in);
	if (!fs.is_open())
	{
		std::cout << "Failed to open file." << std::endl;
		image = nullptr;
		return;
	}
	image = new vector<vector<double>>;
	int row = 0;
	char ch;
	for (int i = 1; i <= 3; i++)  // Somehow there are 3 mysterious, invisible bytes at the beginning of the file
		fs >> ch;
	while (!fs.eof())
	{
		row++;
		vector<double> empty_vector;
		(*image).push_back(empty_vector);
		std::string line;
		getline(fs, line);
		std::stringstream ss;
		ss << line;
		double i;
		char ch;
		do {
			ss >> i >> ch;
			(*image)[row-1].push_back(i);
		} while (!ss.eof());
	}
	fs.close();
	(*image).pop_back();  // This is the problem with getline - the last number will be read twice
	height = (size_t)(row - 1);
	width = (*image)[0].size();
}

void thermal_image::print_value() const
{
	if (image == nullptr)
	{
		std::cout << "Empty image." << std::endl;
	    return;
	}
	for (int i = 0; i <= height - 1; i++)
	{
		for (int j = 0; j <= width - 1; j++)
		{
			std::cout << (*image)[i][j];
				if (j != width - 1)
					std::cout << ',';
		}
		std::cout << std::endl;
	}
}

void thermal_image::write_ppm(std::string& file_name, double lower_bound, double upper_bound) const
{
	if (image == nullptr)
	{
		std::cout << "Enpty image." << std::endl;
		return;
	}
	if (lower_bound >= upper_bound)
	{
		std::cout << "Invalid boundary" << std::endl;
		return;
	}
	ppm_image img;
	img.width = this->width;
	img.height = this->height;
	img.data = (pixel*)malloc(sizeof(pixel) * img.width * img.height);
	for (int i = 0; i <= height - 1; i++)
	{
		for (int j = 0; j <= width - 1; j++)
		{
			unsigned char grayscale_value;
			double temperature = (*(this->image))[i][j];
			if (temperature < lower_bound)
				grayscale_value = 0;
			else if (temperature > upper_bound)
				grayscale_value = 255;
			else
				grayscale_value = (unsigned char)(255 * (temperature - lower_bound) / (upper_bound - lower_bound));
			(img.data)[i * width + j].r = grayscale_value;
			(img.data)[i * width + j].g = grayscale_value;
			(img.data)[i * width + j].b = grayscale_value;
		}
	}
	FILE *fout;
	fout = fopen(file_name.c_str(), "w");
	write(fout, &img);
	fclose(fout);
	free(img.data);
}