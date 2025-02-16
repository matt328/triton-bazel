load("@rules_cc//cc:cc_library.bzl", "cc_library")

cc_library(
    name = "spdlog",
    hdrs = glob(["bin/spdlog/include/**/*.h"]),
    includes = ["bin/spdlog/include"],
    linkopts = select({
        "@bazel_tools//src/conditions:windows": ["vendor/bin/spdlog/lib/spdlog.lib"],
        "//conditions:default": [
            "-Lspdlog/lib",
            "-lspdlog",
        ],
    }),
    visibility = ["//visibility:public"],
)
