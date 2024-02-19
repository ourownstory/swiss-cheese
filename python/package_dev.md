# Developing Python packages
Note: consider using scripts like https://github.com/github/scripts-to-rule-them-all

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
  
## Using Setuptools aka `setup.py`
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
  
## Release a package to PYPI with setuptools
Assuming you already have your code (incl. setup.py) set up. If not, read this [Real Python Guide](https://realpython.com/pypi-publish-python-package/) first.

```python
pip install twine
python setup.py sdist bdist_wheel
tar tzf dist/packagename-1.0.0.tar.gz
```
Check if tarball contains what you expect.
And then another check:
```python
twine check dist/*
```
Test upload:
```python
twine upload --repository-url https://test.pypi.org/legacy/ dist/*
```
Check the page, is the version number and everything else right?

Create a new virtualenv and install the package from test.pypi:
```python
python -m pip install --extra-index-url https://test.pypi.org/simple/ <packagename>
```
Check if it works.

Finally, actually upload it:
```python
twine upload dist/*
```
Enjoy (and test again): 

```python
 pip install <your-package-name>
```

## Release a package to PYPI with poetry
One-time setup: Create an API token for PyPI and add it to poetry. Guide:
https://www.digitalocean.com/community/tutorials/how-to-publish-python-packages-to-pypi-using-poetry-on-ubuntu-22-04

Publishing procedure:
```
poetry build
```
```
poetry publish
```

