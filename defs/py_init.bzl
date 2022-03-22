"""
Rules to load the Python dependencies. The goal is that other WORKSPACES can
load these symbols after including this repository.
"""

load("@rules_python//python:pip.bzl", "pip_install", "pip_parse")

# Load the Python requirements according to rules_python.
def py_reqs_load(name, reqs_txt):
    # https://github.com/bazelbuild/rules_python#installing-pip-dependencies
    # pip_install(
    #     name = name,
    #     requirements = req_txt,
    # )

    # https://github.com/bazelbuild/rules_python#fetch-pip-dependencies-lazily
    pip_parse(
        name = name,
        requirements_lock = reqs_txt,
    )

# ##   https://github.com/AndrewGuenther/rules_python_poetry_poc   ############
def _poetry_impl(ctx):
    result = ctx.execute(
        [
            "poetry",
            "export",
        ],
        working_directory = str(ctx.path(ctx.attr.lockfile).dirname),
        quiet = False,
    )

    ctx.file("requirements_lock.txt", result.stdout)
    ctx.file("BUILD", "")

poetry_lock = repository_rule(
    implementation = _poetry_impl,
    local = True,
    attrs = {
        "lockfile": attr.label(
            allow_single_file = True,
            mandatory = True,
        ),
    },
)
# #############################################################################
