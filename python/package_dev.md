# Developing Python packages
## `setup.py`
https://godatadriven.com/blog/a-practical-guide-to-using-setup-py/

automatically add README.md to PyPI long description:
```python
# read the contents of your README file
from os import path
this_directory = path.abspath(path.dirname(__file__))
with open(path.join(this_directory, 'README.md'), encoding='utf-8') as f:
    readme = f.read()

setuptools.setup(
    # other arguments omitted
    long_description=readme,
    long_description_content_type='text/markdown'
)
```

## `__init__.py`
From: https://stackoverflow.com/questions/448271/what-is-init-py-for
There are 2 main reasons for `__init__.py`

1) For convenience: the other users will not need to know your functions' exact location in your package hierarchy.
  ```python
  your_package/
    __init__.py
    file1.py
    file2.py
      ...
    fileN.py
  ```

  ```python
  # in __init__.py
  from file1 import *
  from file2 import *
  ...
  from fileN import *
  ```
  ```python
  # in file1.py
  def add():
      pass
  ```

  then others can call add() by

  `from your_package import add`

  without knowing file1, like

  `from your_package.file1 import add`

2) If you want something to be initialized; for example, logging (which should be put in the top level):
  ```python
  import logging.config
  logging.config.dictConfig(Your_logging_config)
  ```
