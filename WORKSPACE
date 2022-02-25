workspace(name = "com_rules_df")

load("//defs:deps.bzl", deps_repos = "deps_repositories")

deps_repos()

# =============================================================================
# Add python dependency:
# https://github.com/bazelbuild/rules_python
# -----------------------------------------------------------------------------

# Convert poetry.lock to requirements_lock.txt.
load("//defs:py_init.bzl", "poetry_lock", "py_reqs_load")

poetry_lock(
    name = "poetry_deps",
    lockfile = "//:poetry.lock",
)

# Parse requirements_lock.txt
py_reqs_load(
    name = "py_reqs_rules_df",
    reqs_txt = "@poetry_deps//:requirements_lock.txt",
)

# Lazily install requirements.
load("@py_reqs_rules_df//:requirements.bzl", "install_deps")

install_deps()

# =============================================================================
# Setup rust rules:
# https://bazelbuild.github.io/rules_rust/
# -----------------------------------------------------------------------------
# https://bazelbuild.github.io/rules_rust/#setup
# - The version referenced in the above link (2022-02-23, commit d8238877c0e552639d3e057aadd6bfcf37592408)
#   does not contain the symbols indicated. Therefore a more recent version is
#   included in the //defs:deps.bzl file.
load("@rules_rust//rust:repositories.bzl", "rules_rust_dependencies", "rust_register_toolchains")

rules_rust_dependencies()

rust_register_toolchains()
