load("@rules_cc//cc:cc_binary.bzl", "cc_binary")

cc_binary(
    name = "util-lib.exe",
    srcs = [
        "src/Logger2.cxx",
        "src/main.cxx",
    ],
    includes = ["include"],
    visibility = ["//visibility:public"],
    deps = ["//vendor:spdlog"],
)

cc_binary(
    name = "util-lib_linux",
    srcs = [
        "src/main.cxx",
    ],
    includes = ["include"],
    visibility = ["//visibility:public"],
    deps = ["//vendor:spdlog"],
)

alias(
    name = "util-lib",
    actual = select({
        "@platforms//os:windows": ":util-lib.exe",
        "//conditions:default": ":util-lib_linux",
    }),
)
