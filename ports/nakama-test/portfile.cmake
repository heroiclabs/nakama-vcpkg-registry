vcpkg_from_git(
    OUT_SOURCE_PATH SOURCE_PATH
    URL https://github.com/heroiclabs/nakama-cpp.git
    REF f73a447c8123a4cd7bfc6ab43f49f0212b884dc1
)

vcpkg_check_features(
    OUT_FEATURE_OPTIONS FEATURE_OPTIONS
    FEATURES
        force-dll-import-export FORCE_DLL_IMPORT_EXPORT
)

vcpkg_cmake_configure(SOURCE_PATH ${SOURCE_PATH}/test
    OPTIONS
        -DREMOTE_NAKAMA_SDK=ON ### use vcpkg to get nakama rather than looking for a local version.
        -DINSTALL_NAKAMA_SDK=OFF ### will be installed via vcpkg
        -DBUILD_EXECUTABLE=OFF
        ${FEATURE_OPTIONS} ### created by vcpkg_check_features
)

vcpkg_cmake_install()
vcpkg_cmake_config_fixup()

file(INSTALL "${SOURCE_PATH}/LICENSE.txt" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)
