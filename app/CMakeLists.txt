set(EXEC_SOURCES 
    "main.cc"
)

add_executable(${EXEC_NAME} ${EXEC_SOURCES})
target_link_libraries( ${EXEC_NAME} PUBLIC ${LIB_NAME})
