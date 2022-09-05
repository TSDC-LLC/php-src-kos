cmake_minimum_required(VERSION 3.14)

project(php LANGUAGES C CXX)

set (CMAKE_C_STANDARD 11)

if (KOS)
	# Initialize CMake library for KasperskyOS SDK.
	include (platform)
	initialize_platform (FORCE_STATIC)

    include (platform/nk)

	find_package (vfs REQUIRED)
    include_directories (${vfs_INCLUDE})

    # Attach a package with VFS entities implementation
    find_package (precompiled_vfs REQUIRED)
    include_directories (${precompiled_vfs_INCLUDE})
endif ()

get_filename_component(PHP_SRC_ROOT "${CMAKE_CURRENT_LIST_DIR}/../../" ABSOLUTE)

set(CMAKE_CXX_VISIBILITY_PRESET hidden)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Wno-strict-aliasing")

include_directories(
    ${PHP_SRC_ROOT}
    ${PHP_SRC_ROOT}/main
    ${PHP_SRC_ROOT}/TSRM
    ${PHP_SRC_ROOT}/Zend
)

if (KOS)
    foreach(ITEM ${CMAKE_SYSTEM_PREFIX_PATH})
        include_directories(${ITEM}/include/libxml2)
    endforeach()
else ()
    include_directories(/usr/include/libxml2)
endif ()

add_subdirectory(fpm)

#
# Package configure file
#
include(CMakePackageConfigHelpers)

set(LIB_INSTALL_DIR ${CMAKE_INSTALL_PREFIX}/lib)
set(BIN_INSTALL_DIR ${CMAKE_INSTALL_PREFIX}/bin)

configure_package_config_file(php-config.cmake.in
	${CMAKE_CURRENT_BINARY_DIR}/php-config.cmake
	INSTALL_DESTINATION ${LIB_INSTALL_DIR}/php/cmake
	PATH_VARS BIN_INSTALL_DIR
)

write_basic_package_version_file(
	${CMAKE_CURRENT_BINARY_DIR}/php-config-version.cmake
	VERSION 1.0.0
	COMPATIBILITY SameMajorVersion
)

install(FILES
	${CMAKE_CURRENT_BINARY_DIR}/php-config.cmake
	${CMAKE_CURRENT_BINARY_DIR}/php-config-version.cmake
	DESTINATION ${LIB_INSTALL_DIR}/cmake/php
)
