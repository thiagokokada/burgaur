=======
burgaur
=======

----------------------------------------
A delicious AUR helper. Made from cower.
----------------------------------------

:Author: thiago.mast3r@gmail.com
:Date: 2015-05-06
:Copyright: Thiago Kenji Okada
:Version: 2.0
:Manual section: 1
:Manual group: system


SYSNOPSIS
=========

**burgaur** [*OPTIONS*]... [*COMMANDS*]...


DESCRIPTION
===========

**Burgaur** is an AUR helper based on and strictly a superset of ``cower``. It
automates boring tasks that in cower you need to do by hand, like updating all
your AUR system packages, or installing a new package from AUR including its
dependencies.

It doesn't try to be everything (i.e. ``yaourt``). Instead, it simply assumes
that there is already a better tool to do some job and only tries to complement
other tools.

It also has a better behavior with multiple packages than most AUR helpers,
based on the behavior of ``pacaur``. Basically, instead of the traditional
"review one package, build one package, install one package, rinse and repeat",
``burgaur`` does the following:

- Review everything
- Lean back.
- Build everything
- Install everything.

This can speed up things considerably when you're building large packages or
a great number of them.

OPTIONS
=======


optional arguments
~~~~~~~~~~~~~~~~~~

-h, --help                          show this help message

--cower-raw-options OPTIONS         pass arguments directly to cower,
                                    **no sanity check, may break things**

--noconfirm                         skip confirmation prompts during install
                                    process, passed to pacman/makepkg too,
                                    **may be unsafe**

--nodelete                          do not remove temporary build directory
                                    after install

--noinstall                         do not install packages after build,
                                    assume '--nodelete'

--nobuild                           do not build packages,
                                    assume '--nodelete' and '--noinstall'

-c, --color WHEN                    use colored output. WHEN is 'never',
                                    'always' or 'auto' (default)

--version                           show program's version number and exit


update
~~~~~~

-fu, --force-update TARGET          update TARGET unconditionally

-su, --system-update                update all AUR packages


install
~~~~~~~

-mi, --make-install TARGET         make and install package from AUR, including
                                    dependencies

-si, --search-install TARGET        list all packages with target name and let
                                    user choose which ones to install


CONFIGURATION
=============

All configuration is done by setting environmental variables.

* ``BURGAUR_TARGET_DIR``: set temporary directory for building packages
  (default: ``/var/tmp``).
* ``BURGAUR_FILE_MANAGER``: set desired file manager to verify packages
  before building it (default: ``mc``).


EXAMPLES
========

Update all AUR packages

::

    $ burgaur -su


Force-update all packages that contain '-git'

::

    $ burgaur -fu=-git  # The equals (=) is necessary because of the dash (-)


Force-update a package

::

    $ burgaur -fu burgaur-git


Install a package

::

    $ burgaur -mi package


For problematic packages, you can temporarily change 
the package build directory (by default, on ``/var/tmp``) and keep the resulting files for later
use using:

::

    $ BURGAUR_TARGET_DIR=mydir burgaur -mi package --nodelete


Or if you just want to build a package but not install it:

::

    $ BURGAUR_TARGET_DIR=mydir burgaur -mi package --noinstall


Search (and install) with cower

::

    $ burgaur -si "partial description"


SEE ALSO
========

* ``cower`` <https://github.com/falconindy/cower>
* ``makepkg`` <https://wiki.archlinux.org/index.php/Makepkg>


BUGS
====

Please report bugs to ``GitHub`` <https://github.com/m45t3r/burgaur/issues>.


.. vim: ts=8 et sw=4 sts=4
