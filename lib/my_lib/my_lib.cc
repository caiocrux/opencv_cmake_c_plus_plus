/*
 * my_lib.cc
 * 
 * Copyright 2022 Caio Felipe Cruz <caio.crux@gmail.com>
 * 
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
 * MA 02110-1301, USA.
 * 
 * 
 */
#include <iostream>
#include "my_lib.hpp"
#include "config.hpp"
#include <opencv2/opencv.hpp>

using namespace cv;

/**
 * @brief Print the classic Hello World.
 *
 */
void print_hello_world(void) 
{
    std::cout << "Hello World"<< std::endl;
}

void  print_lib_version(void) {
    std::cout << project_name << std::endl;
    std::cout << project_version << std::endl;
}

void open_image(char *argv) {
    Mat image;
    image = imread(argv, 1);
    if ( !image.data ) {
        printf("No image data \n");
        return;
    }
    namedWindow("Display Image", WINDOW_AUTOSIZE );
    imshow("Display Image", image);
    waitKey(0);
}
