set(VCPKG_USE_HEAD_VERSION ON)

vcpkg_from_git(
    OUT_SOURCE_PATH SOURCE_PATH
    URL https://github.com/heroiclabs/nakama-cpp.git
    HEAD_REF master
)

set(VCPKG_USE_HEAD_VERSION OFF)

vcpkg_check_features(
    OUT_FEATURE_OPTIONS FEATURE_OPTIONS
    FEATURES
        wslay BUILD_WSLAY
        grpc  BUILD_GRPC_CLIENT
        curl  BUILD_CURL
        logs  LOGS_ENABLED
        libhttpclient-http WITH_LIBHTTPCLIENT_HTTP
        libhttpclient-ws WITH_LIBHTTPCLIENT_WS
        cpprestsdk-http WITH_CPPRESTSDK_HTTP
)

vcpkg_cmake_configure(SOURCE_PATH ${SOURCE_PATH}
  OPTIONS
    ${FEATURE_OPTIONS} ### created by vcpkg_check_features
)

vcpkg_cmake_install()
vcpkg_cmake_config_fixup()

file(INSTALL "${SOURCE_PATH}/LICENSE.txt" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)
