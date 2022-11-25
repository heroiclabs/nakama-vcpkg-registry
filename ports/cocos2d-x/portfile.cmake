set(VCPKG_USE_HEAD_VERSION ON)

vcpkg_from_git(
    OUT_SOURCE_PATH SOURCE_PATH
    URL https://github.com/heroiclabs/cocos2d-x.git
    HEAD_REF luke/slim-builds
)

set(VCPKG_USE_HEAD_VERSION OFF)

vcpkg_find_acquire_program(PYTHON2)

execute_process(COMMAND ${CMAKE_COMMAND} -E echo "yes" # accept metal support
     COMMAND "${PYTHON2}" "download-deps.py"
     WORKING_DIRECTORY ${SOURCE_PATH}
     COMMAND_ECHO STDOUT ECHO_OUTPUT_VARIABLE ECHO_ERROR_VARIABLE COMMAND_ERROR_IS_FATAL ANY)

vcpkg_cmake_configure(SOURCE_PATH ${SOURCE_PATH}
    OPTIONS
        -DBUILD_LUA_LIBS=OFF
        -DBUILD_CPP_TEMPLATE=OFF
        -DBUILD_CPP_TESTS=OFF
)

vcpkg_cmake_install()
