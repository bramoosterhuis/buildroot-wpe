PYTHON3_SETUPTOOLS_VERSION = 18.7.1
PYTHON3_SETUPTOOLS_SOURCE = setuptools-$(PYTHON_SETUPTOOLS_VERSION).tar.gz
PYTHON3_SETUPTOOLS_SITE = http://pypi.python.org/packages/source/s/setuptools
PYTHON3_SETUPTOOLS_LICENSE = Python Software Foundation or Zope Public License
PYTHON3_SETUPTOOLS_LICENSE_FILES = PKG-INFO
PYTHON3_SETUPTOOLS_SETUP_TYPE = setuptools
HOST_PYTHON3_SETUPTOOLS_NEEDS_HOST_PYTHON = python3

$(eval $(host-python-package))
