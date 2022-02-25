# https://docs.bazel.build/versions/main/be/make-variables.html#predefined_genrule_variables
# https://github.com/bazelbuild/rules_python/issues/340#issuecomment-974719596

# 2022-02-24: Generated the requirements_lock.txt correctly, but didn't manage
#             to consume output in pip_install. Therefore used repository rule
#             in py_init.bzl.
genrule(
    name = "poetry_to_requirements",
    srcs = [
        "pyproject.toml",
        "poetry.lock",
    ],
    outs = ["requirements_lock.txt"],
    cmd = "cp $(SRCS) $(RULEDIR) && cd $(RULEDIR) && poetry export --output requirements_lock.txt",
    output_to_bin_dir = True,
)
