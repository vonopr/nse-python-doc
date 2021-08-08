

Examples of nseplot1d usage
===========================

This is a collection of ``nseplot1d`` usage cases.


Download sample data
^^^^^^^^^^^^^^^^^^^^^

We provide some sample data to demonstrate how ``nseplot1d`` works.
You may download it with

.. program-output:: cat ./init.sh

.. runpython::
   :rst:
   :nopep8:
   :process:

   import subprocess
   from pathlib import Path
   
   workdir = Path("./build/html/work")
   workdir.mkdir(parents=True, exist_ok=True)
   output = subprocess.call("sh ../../../source/init.sh", shell=True, cwd="build/html/work", stderr=subprocess.DEVNULL, stdout=subprocess.DEVNULL) 
   print("")

The directory tree would be as following:

.. program-output:: tree -d .
   :cwd: ../build/html/work


Basic plot
^^^^^^^^^^^

To get a basic plot of timeseries contained in *../data/series/energy.dsq* run:

.. command-output:: nseplot1d  ../data/series/energy.dsq
   :cwd: ../build/html/work/pics

This will produce an image *energy.png* inside your working directory *pics*:

.. figure:: ../build/html/work/pics/energy.png
   :scale: 25%


Input and output files
^^^^^^^^^^^^^^^^^^^^^^

To alter the name of the output provide ``-o`` option:

.. command-output::  nseplot1d ../data/series/energy.dsq -o energy_alter.jpg
   :cwd: ../build/html/work/pics

Multiple input files are also possible. In this case ``-o`` option is not applicable.

.. command-output:: nseplot1d ../data/series/energy.dsq ../data/series/phys.dsq
   :cwd: ../build/html/work/pics

.. program-output:: echo "nseplot1d ../data/series/*.dsq"


Select variables
^^^^^^^^^^^^^^^^

Choose variables to plot with ``--vars`` option:

.. command-output:: nseplot1d ../data/series/energy.dsq  --vars "u-TKE [avg]" "v-TKE [avg]" -o energy-uv.png  
   :cwd: ../build/html/work/pics

.. figure:: ../build/html/work/pics/energy-uv.png
   :scale: 25%


X and Y bounds
^^^^^^^^^^^^^^^^^^

You can specify X and Y bounds of plot with ``--t1``, ``--t2`` and ``vmin``, ``vmax`` options.
Units for X-bounds are record numbers, not physical time units.

.. command-output:: nseplot1d --t1 50000 --t2 60000 --vmin 0.002 --vmax 0.004 ../data/series/energy.dsq -o energy-xy.png 
   :cwd: ../build/html/work/pics

.. figure:: ../build/html/work/pics/energy-xy.png
   :scale: 25%


Reference values
^^^^^^^^^^^^^^^^

You can choose a reference variable within the input file with ``--ref`` option.
Its values will be subtracted from all plotted variables:

.. command-output:: nseplot1d ../data/series/energy.dsq --ref "TKE [avg]" --vars "TKE [avg]" "u-TKE [avg]" -o energy-tke-ref.png 
   :cwd: ../build/html/work/pics

.. figure:: ../build/html/work/pics/energy-tke-ref.png
   :scale: 25%

You can choose a reference file with ``--diff`` option.
Its values will be subtracted from  all variables' values of input files.
If you additionall provide reference varaible with ``--ref`` option 
then values of reference variable in the reference file will be subtracted.

All input files must be conform with the reference file. They must have same
variables and number of records.

.. command-output:: nseplot1d ../data/series/energy.dsq --diff ../data/series/energy.dsq -o energy-tke-fref.png 
   :cwd: ../build/html/work/pics

.. figure:: ../build/html/work/pics/energy-tke-fref.png
   :scale: 25%


Title, labels and legend
^^^^^^^^^^^^^^^^^^^^^^^^^

To add the title and axis labels use ``-t``, ``--xlabel`` and ``--ylabel`` options

.. command-output:: nseplot1d ../data/series/energy.dsq -t "TKEs, exp #1" --xlabel "time, hours" --ylabel "energy,  m²s⁻²"  -o energy-t.png 
   :cwd: ../build/html/work/pics

.. figure:: ../build/html/work/pics/energy-t.png
   :scale: 25%

You can adjust the label's position and orientation providing extra 
arguments to ``--xlabel`` and ``--ylabel``. See ``--help`` for list of available keywords.

.. command-output:: nseplot1d ../data/series/energy.dsq --ylabel "energy, m²s⁻²" top hor -t "TKEs, exp #1" --xlabel "time, hours" right   -o energy-t-ad.png 
   :cwd: ../build/html/work/pics

.. figure:: ../build/html/work/pics/energy-t-ad.png
   :scale: 25%

Legend position is contolled with ``--legend-loc`` option. 
See ``--help`` for list of available keywords.

.. command-output:: nseplot1d ../data/series/energy.dsq --legend-loc="upper right" -t "TKEs, exp #1" --xlabel "time, hours"  --ylabel "energy, m²s⁻²"   -o energy-lloc.png 
   :cwd: ../build/html/work/pics

.. figure:: ../build/html/work/pics/energy-lloc.png
   :scale: 25%
