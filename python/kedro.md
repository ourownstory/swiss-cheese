# Using Kedro with Poetry

There are different ways to do this, but as of Kedro 19.2, [kedro initializes with setuptools, not poetry](https://github.com/kedro-org/kedro/issues/1722#issuecomment-1839694525). But that is simple to fix.

Assuming you want to use poetry's envs, too - we first have to set up a minimal poetry project.
All we need is a minimal `pyproject.toml`:
```
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

Now we can create a poetry virtual environment:
`poetry shell`
And then install our packages, in this case just kedro:
`poetry update`
Next, we can set up Kedro, which will prompt us to give the project a name and few more options:
`kedro new`
Assuming we called the project `projectname`, and said no to all other options, we end up with these folders and files:
```
> tree
.
├── poetry.lock
├── projectname
│   ├── conf
│   │   ├── base
│   │   │   ├── catalog.yml
│   │   │   └── parameters.yml
│   │   ├── local
│   │   │   └── credentials.yml
│   │   └── README.md
│   ├── notebooks
│   ├── pyproject.toml
│   ├── README.md
│   ├── requirements.txt
│   └── src
│       └── projectname
│           ├── __init__.py
│           ├── __main__.py
│           ├── pipeline_registry.py
│           ├── pipelines
│           │   └── __init__.py
│           └── settings.py
└── pyproject.toml

8 directories, 14 files
```
