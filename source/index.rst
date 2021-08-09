.. toctree::
   :maxdepth: 4
   :hidden:

   nseplot1d
   

nse-python
===========

.. _nse-python: http://tesla.parallel.ru/vonopr/nse-python

This is the documention of nse-python_ project.
It provides python tools for processing the output of nse projects.




Installation
-------------

Download ``nse-python`` with git and install with ``pip``

.. code-block:: text

  git clone http://tesla.parallel.ru/vonopr/nse-python.git
  cd nse-python
  pip install .
  
Usage
-----

nseplot2d
^^^^^^^^^

You can create 2d plots from *.plt* and *.nsq*  
files with ``nseplot2d`` utitlity. Assume that you have *plt-3d/velocity-2.plt* file with U,V and W variables.

Run command

.. command-output:: nseplot2d plt-3d/velocity-2.plt U
   :cwd: ../build/html/work/data 


to achieve an image *velocity-2_U_z0.png*:

.. image:: ../build/html/work/data/velocity-2_U_z0.png
   :scale: 70%

You can set Z-level with ``--z0`` option. Also, you can adjust the image title,
axes label and colormap with options ``--title``, ``--xlabel``, ``--ylabel``  
and ``cmap``. 

.. command-output:: nseplot2d plt-3d/velocity-2.plt V --z0 30 --cmap speed --title "Check this colormap"
   :cwd: ../build/html/work/data

.. image:: ../build/html/work/data/velocity-2_V_z30.png
   :scale: 70%

.. command-output:: nseplot2d binary-3d/temperature-init.nsx Temperature --cmap coolwarm --xlabel "X, km" --ylabel "Y, km" 
   :cwd: ../build/html/work/data 

.. image:: ../build/html/work/data/temperature-init_Temperature_z0.png
   :scale: 70%

To get list of available color maps run ``nseplot2d`` with ``--cmaps``
options. To get help message use ``--help`` option.


nseplotvec
^^^^^^^^^^

To plot velocity vector with ``nseplotvec`` at 30-th depth level run

.. command-output:: nseplotvec binary-3d/velocity-init.nsx U V --z0 30
   :cwd: ../build/html/work/data

An image *velocity-init_UV_z30.png* will be produced.

.. image:: ../build/html/work/data/velocity-init_UV_z30.png 
   :scale: 70% 

The grid resolution is rather high. It makes the plot bloated with arrows.
To skip drawing every second arrow along X and Y axis run ``nseplotvec``
with ``--skip`` option:

.. command-output:: nseplotvec binary-3d/velocity-init.nsx U V --z0 30 --skip 2 2 -o vec_skipped.png
   :cwd: ../build/html/work/data

.. image:: ../build/html/work/data/vec_skipped.png
   :scale: 70%

Adjust the plot with options: ``--title``, ``--xlabel``, ``--ylabel``, ``--cmap``.
 
.. command-output:: nseplotvec plt-3d/velocity-2.plt U V --cmap viridis  --title "My title" --xlabel "My X axis label" --ylabel "My Y axis label" --skip 3 3
   :cwd: ../build/html/work/data

.. image:: ../build/html/work/data/velocity-2_UV_z0.png
   :scale: 70%

To get help message use ``--help`` option.

nseplot1d
^^^^^^^^^

To create a plot of timeseries contained in a *.dsq* file
*series/energy.dsq* run

.. command-output:: nseplot1d series/energy.dsq
   :cwd: ../build/html/work/data

This will produce an image *energy.png* inside your current 
working directory:

.. figure:: ../build/html/work/data/energy.png 
   :scale: 25%

To create a plot from timeseries contained in a *.plt* file you must
provide ``--nzone`` argument. For single zone files it must be ``0``,
for multizone it is less or equal number of zones in file minus one.
 
Also in contast with *.dsq* case, for *.plt* file you must provide ``--vars``
option. It supports regular expression, to plot all variable in the file
pass ``--vars='.+'``.

The command below

.. command-output:: nseplot1d plt-1d/-TKE(z)-balance-12.plt --nzone 0 --vars "TKE.+"
   :cwd: ../build/html/work/data

generates file *-TKE(z)-balance-12.png* with all variables which names start with "TKE".

.. figure:: ../build/html/work/data/-TKE(z)-balance-12.png
   :scale: 25%

The file *plt-1d-multizone/U-1.plt* contains two zones.

.. command-output:: nseplot1d plt-1d-multizone/U-1.plt --nzone 0 --vars ".+"
   :cwd: ../build/html/work/data

.. command-output:: nseplot1d plt-1d-multizone/U-1.plt --nzone 1 --vars ".+"
   :cwd: ../build/html/work/data

.. figure:: ../build/html/work/data/U-1_z0.png
   :scale: 17%

.. figure:: ../build/html/work/data/U-1_z1.png
   :scale: 17%


To get information about ``nseplot1d`` usage run it with ``--help`` flag:

.. command-output:: nseplot1d --help

For other examples check our collection of 
:doc:`nseplot1d usage cases. <nseplot1d>`
