=======
burgaur
=======

----------------------------------------
A delicious AUR helper. Made from cower.
----------------------------------------

:Author: thiago.mast3r@gmail.com
:Date: 2015-03-31
:Copyright: Thiago Kenji Okada
:Version: 1.3
:Manual section: 1
:Manual group: system


SYSNOPSIS
=========

**burgaur** [*OPTIONS*]... [*COMMANDS*]...


DESCRIPTION
===========

Burgaur is an AUR helper based on and strictly a superset of cower. It automates
of boring tasks that in cower you need to do by hand, like updating all your AUR
system packages or installing a new package from AUR including its dependencies.

It doesn't try to be everything (i.e. like yaourt). Instead, it simple assume
that there is already a better tool to do some job and only tries to complement
other tools.


OPTIONS
=======


optional arguments
~~~~~~~~~~~~~~~~~~

-h, --help                          show this help message and exit

--cower-raw-options OPTIONS         pass arguments directly to cower,
                                    WARNING: no sanity check, may break things

--noconfirm                         skip confirmation prompts during install
                                    process, passed to pacman/makepkg too
                                    WARNING: may be unsafe

--nodelete                          do not remove temporary build directory
                                    after install

--noinstall                         do not install packages after build,
                                    assume '--nodelete'

-c, --color WHEN                    use colored output. WHEN is 'never',
                                    'always' or 'auto' (default)

--version                           show program's version number and exit


update
~~~~~~

-fu, --force-update TARGET          force update of installed AUR packages with
                                    target name, useful for updating VCS
                                    packages

-su, --system-update                update all AUR packages


install
~~~~~~~

-mi, --make-install PACKAGE         make and install package from AUR, including
                                    dependencies

-si, --search-install TARGET        list all packages with target name and let
                                    user choose which ones to install


CONFIGURATION
=============

All configuration is done by setting environmental variables.

* ``BURGAUR_TARGET_DIR``: set temporary directory for building packages
  (default: /var/tmp).
* ``BURGAUR_FILE_MANAGER``: set desired file manager to verify packages
  before building it (default: mc).


EXAMPLES
========

To update all out-of-date packages from AUR (excluding VCS packages) you can
run:

::

    $ burgaur -su


To force update all packages ending with -git (like "burgaur-git"), you can
run:

::

    $ burgaur -fu=-git  # The equals (=) is necessary because of the dash (-)


To force update only one package, you can do:

::

    $ burgaur -fu burgaur-git


To install a package that you know the name:

::

    $ burgaur -mi package


For problematic packages, you can temporary change the directory where packages
will be build (by default, on ``/var/tmp``) and keep the result files for later
use using:

::

    $ BURGAUR_TARGET_DIR=mydir burgaur -mi package --nodelete


Or if you just want to build a package but to not install it:

::

    $ BURGAUR_TARGET_DIR=mydir burgaur -mi package --noinstall


To install a package that you only remember some information (like part of the
package description):

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
