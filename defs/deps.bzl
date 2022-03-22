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
        sha256 = "9fcf91dbcc31fde6d1edb15f117246d912c33c36f44cf681976bd886538deba6",
        strip_prefix = "rules_python-0.8.0",
        url = "https://github.com/bazelbuild/rules_python/archive/refs/tags/0.8.0.tar.gz",
    )

    # =========================================================================
    # Import and install bazelbuild/rules_rust (2022-03-22)
    # https://github.com/bazelbuild/rules_rust
    # https://bazelbuild.github.io/rules_rust/
    # -------------------------------------------------------------------------
    maybe(
        http_archive,
        name = "rules_rust",
        sha256 = "7453856d239a004c9e29cde2e45903a068446e4a69501ee7393faf08e1a30403",
        # strip_prefix = "rules_rust",
        urls = [
            "https://mirror.bazel.build/github.com/bazelbuild/rules_rust/releases/download/0.1.0/rules_rust-v0.1.0.tar.gz",
            "https://github.com/bazelbuild/rules_rust/releases/download/0.1.0/rules_rust-v0.1.0.tar.gz",
        ],
    )
