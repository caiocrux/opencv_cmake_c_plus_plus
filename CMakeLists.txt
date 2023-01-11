# 0.) Create Source and CMakeFile
# 1.) mkdir build
# 2.) cd build
# 3.) cmake ..   -  Generting the Build Files / Configure the Project
# 4.) cmake --build .
# 5.) ./Executable
# 6.) cmake --build . --target my_lib
# 7.) cmake --build . --target bin
# 8.) cmake --build . --target docs
# 9.) cmake --build . --target unit_tests


cmake_minimum_required(VERSION 3.22)

project(
    CppProjectTemplate 
    VERSION 1.0.1 
    LANGUAGES C CXX)

set(LIB_NAME "my_lib")
set(EXEC_NAME "app")

set(CMAKE_CXX_STANDARD          17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS        OFF)

#add  opencv dependency  with FetContent
set(CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/cmake/")
include(FetchContent)
include(Docs)
FetchContent_Declare(
    opencv
    GIT_REPOSITORY https://github.com/opencv/opencv.git
    GIT_TAG        4.7.0
    GIT_SHALLOW TRUE
)
FetchContent_MakeAvailable(opencv)
# Find on pc
set(OpenCV_DIR ${CMAKE_CURRENT_BINARY_DIR})
include_directories(${OpenCV_DIR})
find_package(OpenCV REQUIRED)

FetchContent_Declare(
    Catch2
    GIT_REPOSITORY https://github.com/catchorg/Catch2
    GIT_TAG v2.13.9
    GIT_SHALLOW TRUE
)
FetchContent_MakeAvailable(Catch2)

# first build the lib and than the app
add_subdirectory(lib)
add_subdirectory(app)
add_subdirectory(configured)
add_subdirectory(tests)
