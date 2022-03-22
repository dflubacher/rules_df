# Bazel rules repository
This repository should serve as a bazel rules repository to be called from other bazel workspaces. The goal is to avoid having duplicated setup routines in different workspaces.

This is a work in progress. The examples in [./src](./src/) should serve as checks if the rules work as expected.

TODO:
- hermetic toolchain for Python
- Clang toolchain for C/C++
- rules_docker
## Python
- `rules_python` consumes requirements.txt
- Poetry uses `pyproject.toml` of PEP518

Instead of defining the same dependencies in two different files (pyproject.toml/Pipfile and requirements.txt), extract a requirements_lock.txt file from the Poetry lock file. For this a [repository_rule](https://bazel.build/rules/repository_rules) from [this repository](https://github.com/AndrewGuenther/rules_python_poetry_poc) is used.

Example:
```sh
bazel run //src/py:hello_absl -- -name=World
```
## Rust
Example:
```sh
bazel run //src/rust:hello_world
```