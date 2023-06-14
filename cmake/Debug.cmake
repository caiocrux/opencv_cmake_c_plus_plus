if(ENABLE_DEBUG_SYMBOLS)
    if(CMAKE_C_COMPILER_ID MATCHES "Clang" OR CMAKE_CXX_COMPILER_ID MATCHES
                                              "Clang")
        set(IS_CLANG TRUE)
    else()
        set(IS_CLANG FALSE)
    endif()
    if(CMAKE_C_COMPILER_ID MATCHES "GNU" OR CMAKE_CXX_COMPILER_ID MATCHES "GNU")
        set(IS_GCC TRUE)
    else()
        set(IS_GCC FALSE)
    endif()

    if(NOT ${IS_CLANG} AND NOT ${IS_GCC})
        message(FATAL_ERROR "Compiler is not gcc/clang! Aborting...")
    endif()

    set(DEBUG_COMPILER_FLAGS "-g -O0")
    set(CMAKE_CXX_FLAGS_DEBUG ${DEBUG_COMPILER_FLAGS} FORCE)
    set(CMAKE_C_FLAGS_DEBUG ${DEBUG_COMPILER_FLAGS} FORCE)
endif()

mark_as_advanced(
    CMAKE_CXX_FLAGS_DEBUG
    CMAKE_C_FLAGS_DEBUG)

function(append_coverage_compiler_flags)
    set(CMAKE_C_FLAGS
        "${CMAKE_C_FLAGS} ${DEBUG_COMPILER_FLAGS}"
        PARENT_SCOPE)
    set(CMAKE_CXX_FLAGS
        "${CMAKE_CXX_FLAGS} ${DEBUG_COMPILER_FLAGS}"
        PARENT_SCOPE)
    message(
        STATUS
        "Appending debuging compiler flags: ${DEBUG_COMPILER_FLAGS}"
    )
endfunction()
