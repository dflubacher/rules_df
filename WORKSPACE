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
load("@rules_rust//rust:repositories.bzl", "rules_rust_dependencies", "rust_register_toolchains")

rules_rust_dependencies()

rust_register_toolchains()
