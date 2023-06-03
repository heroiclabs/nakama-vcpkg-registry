vcpkg_from_git(
    OUT_SOURCE_PATH SOURCE_PATH
    URL https://github.com/heroiclabs/nakama-cpp.git
    REF ddd48a9ff926ce9b06e9afbd80b6d4146c3cc377
)

set(BUILD_SHARED_NAKAMA_SDK ON)

if (VCPKG_LIBRARY_LINKAGE STREQUAL "static")
    set(BUILD_SHARED_NAKAMA_SDK OFF)
endif()

vcpkg_cmake_configure(SOURCE_PATH ${SOURCE_PATH}/test
    OPTIONS
        -DREMOTE_NAKAMA_SDK=ON ### use vcpkg to get nakama rather than looking for a local version.
        -DBUILD_EXECUTABLE=OFF
        -DBUILD_SHARED_NAKAMA_SDK=${BUILD_SHARED_NAKAMA_SDK}
)

vcpkg_cmake_install()
vcpkg_cmake_config_fixup()

file(INSTALL "${SOURCE_PATH}/LICENSE.txt" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)
