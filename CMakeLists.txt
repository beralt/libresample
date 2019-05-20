cmake_minimum_required(VERSION 2.8.11)
project(libresample C)

set(OBJS
	src/resample.c
	src/resamplesubs.c
	src/filterkit.c
	)

add_library(resample SHARED ${OBJS})
target_include_directories(resample PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/include)
target_include_directories(resample PRIVATE ${CMAKE_CURRENT_BINARY_DIR})

install(TARGETS resample
        RUNTIME DESTINATION bin
        LIBRARY DESTINATION lib)

add_executable(testresample ${CMAKE_CURRENT_SOURCE_DIR}/tests/testresample.c)
target_link_libraries(testresample resample m)

include(CheckIncludeFiles)
include(FindPkgConfig)

CHECK_INCLUDE_FILES("inttypes.h" HAVE_INTTYPES_H)

configure_file(${CMAKE_SOURCE_DIR}/src/configtemplate.h
	             ${CMAKE_BINARY_DIR}/config.h)

option(enable-libsndfile "compile libsndfile support (if it is available)" off)
option(enable-libsamplerate "compile libsamplerate support (if it is available)" off)

set(LIBSNDFILE_SUPPORT)
if (enable-libsndfile)
	pkg_check_modules(LIBSNDFILE sndfile)
	set(LIBSNDFILE_SUPPORT ${LIBSNDFILE_FOUND})
	add_executable(resample-sndfile ${CMAKE_CURRENT_SOURCE_DIR}/tests/resample-sndfile.c)
	target_link_libraries(resample-sndfile resample ${LIBSNDFILE_FOUND})
	add_test(NAME resample-sndfile COMMAND resample-sndfile)
endif (enable-libsndfile)

set(LIBSAMPLERATE_SUPPORT)
if (enable-libsamplerate)
	pkg_check_modules(LIBSAMPLERATE samplerate)
	set(LIBSAMPLERATE_SUPPORT ${LIBSAMPLERATE_FOUND})
	add_executable(compareresample ${CMAKE_CURRENT_SOURCE_DIR}/tests/compareresample.c)
	target_link_libraries(compareresample resample ${LIBSNDFILE_FOUND})
	add_test(NAME compare COMMAND compareresample)
endif (enable-libsamplerate)

