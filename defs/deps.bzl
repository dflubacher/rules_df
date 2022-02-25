"""
Provides functions to pull dependencies of this repository.
"""

# https://docs.bazel.build/versions/master/repo/http.html#http_archive
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")

# https://docs.bazel.build/versions/main/repo/utils.html#maybe
load(
    "@bazel_tools//tools/build_defs/repo:utils.bzl",
    "maybe",
)

def deps_repositories():
    """Load external repositories."""

    # =========================================================================
    # Add python dependency (2022-02-14):
    # https://github.com/bazelbuild/rules_python
    # -------------------------------------------------------------------------
    maybe(
        http_archive,
        name = "rules_python",
        sha256 = "a30abdfc7126d497a7698c29c46ea9901c6392d6ed315171a6df5ce433aa4502",
        strip_prefix = "rules_python-0.6.0",
        url = "https://github.com/bazelbuild/rules_python/archive/0.6.0.tar.gz",
    )

    # =========================================================================
    # Import and install bazelbuild/rules_rust (2022-02-14)
    # https://github.com/bazelbuild/rules_rust
    # https://bazelbuild.github.io/rules_rust/
    # -------------------------------------------------------------------------
    maybe(
        http_archive,
        name = "rules_rust",
        sha256 = "7240a4865b11427cc58cd00b3e89c805825bfd3cc4c225b7e992a58622bec859",
        strip_prefix = "rules_rust-a619e1a30bb274639b6d2ccb76c820a02b9f94be",
        url = "https://github.com/bazelbuild/rules_rust/archive/a619e1a30bb274639b6d2ccb76c820a02b9f94be.tar.gz",
    )
