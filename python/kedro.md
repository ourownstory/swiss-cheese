# Using Kedro with Poetry

There are different ways to do this, but as of Kedro 19.2, [kedro initializes with setuptools, not poetry](https://github.com/kedro-org/kedro/issues/1722#issuecomment-1839694525). But that is simple to fix.

Assuming you want to use poetry's envs, too - we first have to set up a minimal poetry project.
We need the following file structure:
```
❯ tree
.
├── README.md
├── pyproject.toml
└── src
    └── package-name
        └── __init__.py
3 directories, 3 files
```

With a minimal pyproject.toml 
```
❯ cat pyproject.toml 
[build-system]
requires = ["poetry-core"]
build-backend = "poetry.core.masonry.api"

[tool.poetry]
name = "package-name"
version = "0.1.0"
description = ""
authors = ["Your Name <name@you.com>"]
readme = "README.md"

[tool.poetry.dependencies]
python = "^3.10"
kedro = "0.19.2"
```
