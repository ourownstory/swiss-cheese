# Python
in this folder:
* [Knowledge Dump](python/knowledge_dump.md) Contains random tidbits of knowledge about python code and theory.
* [Resources for developing an open-source package](python/package_dev.md)
* 
* [Using Kedro with Poetry](kedro.md)

## Managing python versions
Great guide on how to install and manage multiple python versions on an ubuntu based OS: https://hackersandslackers.com/multiple-versions-python-ubuntu/


## Documentation
* using mkdocs with github pages: https://www.mkdocs.org/user-guide/deploying-your-docs/
* using custom domain: https://docs.github.com/en/pages/configuring-a-custom-domain-for-your-github-pages-site
* use the Sphinx documentation framework to build the documentation website, which is hosted via Github Pages. (Details: The documentation's source is enclosed in the docs folder. Whereas the main branch only contains the basic source files, the branch gh-pages entails the build data (with folders docs/html and docs/doctrees) and is used for deployment.)
* Docstrings: format according to [NumPy Style](https://sphinxcontrib-napoleon.readthedocs.io/en/latest/example_numpy.html#example-numpy) in order to display their API reference correctly using Spinx. Please refer to [Pandas Docstring Guide](https://pandas.pydata.org/pandas-docs/stable/development/contributing_docstring.html#) for best practices. The length of line inside docstrings block must be limited to 80 characters to fit into Jupyter documentation popups.
* Jupyter notebooks: render using the Sphinx nblink package. (Details: When you add a new tutorial notebook, please add the tutorial file to the respective section inside docs/source/contents.rst. Further, generate the corresponding .nblink files)
* Principles for documentation structure: https://diataxis.fr/
* Great Readme: https://dbader.org/blog/write-a-great-readme-for-your-github-project
