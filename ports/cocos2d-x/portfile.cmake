set(VCPKG_USE_HEAD_VERSION ON)

vcpkg_from_git(
    OUT_SOURCE_PATH SOURCE_PATH
    URL https://github.com/heroiclabs/cocos2d-x.git
    HEAD_REF v4
)

set(VCPKG_USE_HEAD_VERSION OFF)

execute_process(COMMAND ${CMAKE_COMMAND} -E echo "yes" # accept metal support
     COMMAND "python" "download-deps.py"
     WORKING_DIRECTORY ${cocos2d-x_SOURCE_DIR}
     COMMAND_ECHO STDOUT ECHO_OUTPUT_VARIABLE ECHO_ERROR_VARIABLE COMMAND_ERROR_IS_FATAL ANY)

vcpkg_cmake_configure(SOURCE_PATH ${SOURCE_PATH})


vcpkg_cmake_config_fixup()
vcpkg_cmake_install()
