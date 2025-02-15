load("@rules_cc//cc:cc_binary.bzl", "cc_binary")

cc_binary(
    name = "util-lib.exe",
    srcs = [
        "src/main.cxx",
    ],
    includes = ["include"],
    visibility = ["//visibility:public"],
)

cc_binary(
    name = "util-lib_linux",
    srcs = [
        "src/main.cxx",
    ],
    includes = ["include"],
    visibility = ["//visibility:public"],
)

alias(
    name = "util-lib",
    actual = select({
        "@platforms//os:windows": ":util-lib.exe",
        "//conditions:default": ":util-lib_linux",
    }),
)
