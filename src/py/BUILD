load("@rules_python//python:defs.bzl", "py_binary")
load("@py_reqs_rules_df//:requirements.bzl", "requirement")

py_binary(
    name = "hello_absl",
    srcs = [
        ":hello_absl.py",
    ],
    main = ":hello_absl.py",
    deps = [
        requirement("absl-py"),
        # requirement("pyyaml"),
    ],
)
