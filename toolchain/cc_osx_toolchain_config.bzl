""" Toolchain Configuration Provider """

load("@bazel_tools//tools/build_defs/cc:action_names.bzl", "ACTION_NAMES")
load(
    "@bazel_tools//tools/cpp:cc_toolchain_config_lib.bzl",
    "feature",
    "flag_group",
    "flag_set",
    "tool_path",
)
load("@rules_cc//cc/common:cc_common.bzl", "cc_common")

all_link_actions = [
]

def _impl(ctx):
    tool_paths = [
        tool_path(
            name = "gcc",
            path = "/usr/local/opt/llvm/bin/clang",
        ),
        tool_path(
            name = "ld",
            path = "/usr/local/opt/llvm/bin/ld.lld",
        ),
        tool_path(
            name = "linker",
            path = "/usr/local/opt/llvm/bin/ld.lld",
        ),
        tool_path(
            name = "ar",
            path = "/usr/bin/ar",
        ),
        tool_path(
            name = "cpp",
            path = "/bin/false",
        ),
        tool_path(
            name = "gcov",
            path = "/bin/false",
        ),
        tool_path(
            name = "nm",
            path = "/bin/false",
        ),
        tool_path(
            name = "objdump",
            path = "/bin/false",
        ),
        tool_path(
            name = "strip",
            path = "/bin/false",
        ),
    ]

    features = [
        feature(
            name = "c++23",
            enabled = True,
            flag_sets = [
                flag_set(
                    actions = [
                        ACTION_NAMES.cpp_compile,
                    ],
                    flag_groups = ([
                        flag_group(
                            flags = [
                                "--std=c++23",
                            ],
                        ),
                        flag_group(
                            flags = [
                                "-lc++",
                            ],
                        ),
                    ]),
                ),
                flag_set(
                    actions = [
                        ACTION_NAMES.cpp_link_executable,
                    ],
                    flag_groups = ([
                        flag_group(
                            flags = [
                                "-lc++",
                            ],
                        ),
                    ]),
                ),
            ],
        ),
    ]

    return cc_common.create_cc_toolchain_config_info(
        ctx = ctx,
        features = features,
        cxx_builtin_include_directories = [
            "/usr/local/Cellar/llvm/19.1.7/include/c++/v1/",
            "/usr/local/Cellar/llvm/19.1.7/lib/clang/19/include",
            "/Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include",
        ],
        toolchain_identifier = "k8-toolchain",
        host_system_name = "local",
        target_system_name = "local",
        target_cpu = "k8",
        target_libc = "unknown",
        compiler = "clang",
        abi_version = "unknown",
        abi_libc_version = "unknown",
        tool_paths = tool_paths,
    )

cc_osx_toolchain_config = rule(
    implementation = _impl,
    attrs = {},
    provides = [CcToolchainConfigInfo],
)
