import os
from setuptools import setup
from imp import load_source

burgaur = load_source("burgaur", "burgaur")


def read(fname):
    filename = os.path.join(os.path.dirname(__file__), fname)
    return open(filename).read().replace('#', '')

setup(
    name="burgaur",
    version=burgaur.__version__,
    author=burgaur.__author__,
    author_email=burgaur.__email__,
    maintainer=burgaur.__maintainer__,
    maintainer_email=burgaur.__email__,
    description=("A delicious AUR helper. Made from cower."),
    license=burgaur.__license__,
    url="https://github.com/m45t3r/burgaur",
    scripts=["burgaur"],
    platforms=["Linux"],
    long_description=read("README.rst"),
)
