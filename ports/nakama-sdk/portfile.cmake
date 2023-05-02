vcpkg_from_git(
    OUT_SOURCE_PATH SOURCE_PATH
    URL https://github.com/heroiclabs/nakama-cpp.git
    REF 166e83cd863b0d7957c9a5d6521b89cf3848ab53
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
        visual-studio VISUAL_STUDIO_GENERATOR
)

set(GENERATOR "Ninja Multi-Config")

if (VISUAL_STUDIO_GENERATOR)
    set(GENERATOR "Visual Studio 17 2022")
endif()

message("Configuring Nakama with generator: ${GENERATOR}")

vcpkg_cmake_configure(SOURCE_PATH ${SOURCE_PATH}
  GENERATOR ${GENERATOR}
  OPTIONS
    -DDISTRIBUTE_OPTIONAL_LITE=OFF ### vcpkg will handle the distribution rather than the SDK itself
    ${FEATURE_OPTIONS} ### created by vcpkg_check_features
)

vcpkg_cmake_install()
vcpkg_cmake_config_fixup()

file(INSTALL "${SOURCE_PATH}/LICENSE.txt" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)
