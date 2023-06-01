vcpkg_from_git(
    OUT_SOURCE_PATH SOURCE_PATH
    URL https://github.com/heroiclabs/nakama-cpp.git
    REF f2f6a3d09e6b84e6bf5bac2e3de57290165a30bd
)

vcpkg_cmake_configure(SOURCE_PATH ${SOURCE_PATH}/test
    OPTIONS
        -DREMOTE_NAKAMA_SDK=ON ### use vcpkg to get nakama rather than looking for a local version.
        -DBUILD_EXECUTABLE=OFF
)

vcpkg_cmake_install()
vcpkg_cmake_config_fixup()

file(INSTALL "${SOURCE_PATH}/LICENSE.txt" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)
