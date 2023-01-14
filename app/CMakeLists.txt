set(EXEC_SOURCES 
    "main.cc"
)

add_executable(${EXEC_NAME} ${EXEC_SOURCES})
target_link_libraries( ${EXEC_NAME} PUBLIC ${LIB_NAME})

target_set_warnings(
    TARGET
    ${EXEC_NAME}
    ENABLE
    ${ENABLE_WARNINGS}
    AS_ERRORS
    ${ENABLE_WARNINGS_AS_ERRORS})
