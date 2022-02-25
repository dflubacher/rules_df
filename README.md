# Bazel rules repository

## Python
- `rules_python` consumes requirements.txt
- Poetry uses `pyproject.toml` of PEP518

Instead of defining the same dependencies in two different files, extract a requirements_lock.txt file from Poetry the lock file. For this a [repository_rule](https://bazel.build/rules/repository_rules) from [this repository](https://github.com/AndrewGuenther/rules_python_poetry_poc) is used.