cmake_minimum_required (VERSION 3.10)

project(php LANGUAGES C CXX)

if (KOS)
    include (platform)

    initialize_platform ()
    include (platform/image)
    include (platform/nk)
    # Needed to find Qt libs from SDK
    set (CMAKE_PREFIX_PATH ${CMAKE_SYSTEM_PREFIX_PATH})

    find_package (vfs REQUIRED)
    include_directories (${vfs_INCLUDE})

    find_package (rump REQUIRED COMPONENTS DHCPCD_ENTITY)
    include_directories (${rump_INCLUDE})
endif ()

set(CMAKE_CXX_VISIBILITY_PRESET hidden)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Wno-strict-aliasing")

set(PHP_SRC_ROOT ${CMAKE_CURRENT_SOURCE_DIR})

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

add_subdirectory(sapi/kos)
