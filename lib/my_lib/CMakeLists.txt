set(LIBRARY_SOURCES
    "my_lib.cc"
)

set(LIBRARY_HEADERS
    "my_lib.hpp"
)

set(LIBRARY_INCLUDES
    "./"
    "${CMAKE_BINARY_DIR}/configured_files/include"
)

add_library(${LIB_NAME} STATIC 
    ${LIBRARY_SOURCES}
    ${LIBRARY_HEADERS}
)

target_include_directories( ${LIB_NAME} PUBLIC
    ${LIBRARY_INCLUDES}
)

target_link_libraries( ${LIB_NAME} PUBLIC 
    ${OpenCV_LIBS}
)
