set(VCPKG_USE_HEAD_VERSION ON)
message("CURRENT_BUILDTREES_DIR ${CURRENT_BUILDTREES_DIR}")
set(SOURCE_PATH ${CURRENT_BUILDTREES_DIR})



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

file(REMOVE_RECURSE ${CURRENT_BUILDTREES_DIR}/cocos2d-x-src)

### cocos is not installable so we resort to an add_subdirectory workaround.
file(COPY ${SOURCE_PATH} DESTINATION ${CURRENT_BUILDTREES_DIR})
get_filename_component(SOURCE_NAME ${SOURCE_PATH} NAME)
file(RENAME ${CURRENT_BUILDTREES_DIR}/${SOURCE_NAME} ${CURRENT_BUILDTREES_DIR}/cocos2d-x-src)