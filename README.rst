burguer
=======

A delicious AUR helper. Made from cower.
----------------------------------------


Introduction
~~~~~~~~~~~~

This program is a subset of ``cower`` that automates some tedious tasks like updating all your installed AUR packages.

For example, instead of running ``cower -ud`` to download the all new PKGBUILDs, going in each created directory and running ``makepkg -i`` in all of them, you can simply use:

::

    $ burguer -su

This will update all AUR packages that are currently out-of-date.

To install new packages, instead of doing ``cower -dd random_package``, going into each directory and running ``makepkg -si`` (remember that you need to eventually install AUR dependencies too), you can simple do:

::

    $ burguer -mi random_package

And it will do everything for you.

One last trick (at least for now) is using:

::

    $ burguer -ss target

This is equivalent of doing ``cower -s target && cower -m target``, but a faster since it does both searchs in the same time.

How to install
~~~~~~~~~~~~~~

You need to have both ``cower``, ``python`` and ``makepkg`` (part of ``pacman``) installed and added somewhere on your PATH. If you have all of them you can simply download the script and use it.

But you will probably prefer to use the included PKGBUILD to create a nice installable package. You can download it in some folder and run:

::

    $ makepkg -si

To create and install the package. Alternatively you can go to `AUR`_ and install the lastest current available version.

Credits
~~~~~~~

This project is based on `cower`_. Thanks falconindy for this amazing piece of program.

.. _`cower`: https://aur.archlinux.org/packages/cower/
.. _`AUR`: https://aur.archlinux.org/packages/burguer/
