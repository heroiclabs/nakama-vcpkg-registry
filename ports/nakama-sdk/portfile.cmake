vcpkg_from_git(
    OUT_SOURCE_PATH SOURCE_PATH
    URL https://github.com/heroiclabs/nakama-cpp.git
    REF 0cd84e7967789bb5a8dd438536c2f75cd5f0ad0a
)

vcpkg_check_features(
    OUT_FEATURE_OPTIONS FEATURE_OPTIONS
    FEATURES
        wslay BUILD_WSLAY
        grpc  BUILD_GRPC_CLIENT
        curl-io  BUILD_CURL_IO
        curl-http  BUILD_CURL_HTTP
        logs  LOGS_ENABLED
        libhttpclient-http WITH_LIBHTTPCLIENT_HTTP
        libhttpclient-ws WITH_LIBHTTPCLIENT_WS
        cpprestsdk WITH_CPPRESTSDK
        windows-use-msbuild WINDOWS_USE_MSBUILD
        force-dll-import-export FORCE_DLL_IMPORT_EXPORT
)

if(WINDOWS_USE_MSBUILD)
    set(WINDOWS_USE_MSBUILD_OPTION "WINDOWS_USE_MSBUILD")
else()
    set(WINDOWS_USE_MSBUILD_OPTION "")
endif()

vcpkg_cmake_configure(SOURCE_PATH ${SOURCE_PATH}
  ${WINDOWS_USE_MSBUILD_OPTION}
  OPTIONS
    -DDISTRIBUTE_OPTIONAL_LITE=OFF ### vcpkg will handle the distribution rather than the SDK itself
    ${FEATURE_OPTIONS} ### created by vcpkg_check_features
)

vcpkg_cmake_install()
vcpkg_cmake_config_fixup()

file(INSTALL "${SOURCE_PATH}/LICENSE.txt" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)
