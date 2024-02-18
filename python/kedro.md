# Using Kedro with Poetry

There are different ways to do this, but as of Kedro 19.2, [kedro initializes with setuptools, not poetry](https://github.com/kedro-org/kedro/issues/1722#issuecomment-1839694525). But that is simple to fix.

Assuming you want to use poetry's envs, too - we first have to set up a poetry project.
All we need is a minimal `pyproject.toml`:
```
[build-system]
requires = ["poetry-core"]
build-backend = "poetry.core.masonry.api"

[tool.poetry]
name = "projectname"
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

Now main work of **converting the `pyproject.toml` from `setuptools` to `poetry`** begins.
Our new, kedro-generated `projectname/pyproject.toml` looks like this:

```
[build-system]
requires = [ "setuptools",]
build-backend = "setuptools.build_meta"

[project]
name = "projectname"
readme = "README.md"
dynamic = [ "dependencies", "version",]

[project.scripts]
projectname = "projectname.__main__:main"

[tool.kedro]
package_name = "projectname"
project_name = "projectname"
kedro_init_version = "0.19.2"
tools = [ "None",]
example_pipeline = "False"
source_dir = "src"

[project.entry-points."kedro.hooks"]

[tool.setuptools.dynamic.dependencies]
file = "requirements.txt"

[tool.setuptools.dynamic.version]
attr = "projectname.__version__"

[tool.setuptools.packages.find]
where = [ "src",]
namespaces = false
```

We can simply copy all the contents from our initial pyproject.toml, and add them in on the top. 
We then need to delete the pre-existing `[build-system]` section that is referring to `setuptools`.
In fact, we can delete all other `[tool.setuptools.xyz]` sections, as well.

Then we can deal with the `[project]` sections:
The main `[project]` section can be deleted (or merged) as we replaced it with our `[tool.poetry]` section.
The `[project.scripts]` section we can simply rename to `[tool.poetry.scripts]`.
We also rename `[project.entry-points."kedro.hooks"]` to `[tool.poetry.plugins."kedro.hooks"]` (Note: Not certain that this is correct though.)

Further, we need to add any further required packages, that the template had defined in `projectname/requirements.txt` to our new `[tool.poetry.dependencies]` section.

Now, our `projectname/pyproject.toml` file looks like this:
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
ipython = ">=8.10"
jupyterlab = ">=3.0"
notebook = ">=7.1.0"

[tool.poetry.scripts]
projectname = "projectname.__main__:main"

[tool.kedro]
package_name = "projectname"
project_name = "projectname"
kedro_init_version = "0.19.2"
tools = [ "None",]
example_pipeline = "False"
source_dir = "src"

[project.entry-points."kedro.hooks"]
```
And that's all the heavy editing. 

Finally, we can clean up and  delete `projectname/requirements.txt` and the `pyproject.toml` and `poetry.lock` files in the project root directory.

We `cd projectname` and re-run `poetry update` to re-initialize the poetry.lock file and install all the required packages. 

With `kedro info` we can check if all is well.



