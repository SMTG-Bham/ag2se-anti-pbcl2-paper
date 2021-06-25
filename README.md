## Data for paper "On the Crystal Structure of Colloidally Prepared Metastable Ag<sub>2</sub>Se Nanocrystals"

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.5028256.svg)](https://doi.org/10.5281/zenodo.5028256)


Content of the repository

- `search-data` contains the relaxed structures sampled by ab initio random structure searching (AIRSS).
- `refined-structures` contains the structures further relaxed using VASP and used for make the figure.
- `phonon` contains the raw calculation data for the phonon calculations export from AiiDA file repository.
- `ag2se-calcs.aiida` is an AiiDA export file containing all calculation performed and reported in paper with their full provenance. This file can be imported into an AiiDA instance (`aiida-core >= 1.6.3`). Raw data may also be access by simply unzipping the file. This file is hosted by [Zenodo](https://zenodo.org/api/files/baed3fb2-a4d3-49f7-a5d1-cb8da7cdbf28/ag2se-calcs.aiida?versionId=0e916ddb-428d-4355-a8a1-d801cc90844a).
- `notebooks` contains the notebooks for data analysis and visualisation.
- `figures` contains the figures in the PNG and the SVG format. The SVG figures are generated using Inkscape.
- `antiPbCl2like_Ag2Se_laboratory.cif` is the experimental structure generated using a Rietveld refinement of the anti-PbCl2-like structure to Ag2Se.


## Importing data into a new AiiDA Database

The provenance data stored in the `ag2se-calcs.aiida` can be imported into a AiiDA database and allow the analysis in the `notebooks` folder to be reproduced.
A few dependencies needs to be installed:

- `aiida-core>=1.6.3` is the mean package of the AiiDA framework.
- `aiida-vasp>2.0.1` contains the interface to VASP.
- `ase` and `pymatgen` are needed for the analysis. `ase==3.21` and `pymatgen==2020.10.20` were used in this project, but other compatible version should work as well.
- additional requires in the `requirements.txt`.

A few more steps are needed to step up a new AiiDA profile before importing the archive. Please follow the installation instructions on the [offical documentation](https://aiida.readthedocs.io/).

The magic "%aiida" can be enabled by a file `aiida_magic_register.py` in `<home_folder>/.ipython/profile_default/startup`:


```python
if __name__ == '__main__':

    try:
        import aiida
        del aiida
    except ImportError:
        # AiiDA is not installed in this Python environment
        pass
    else:
        from aiida.tools.ipython.ipython_magics import register_ipython_extension
        register_ipython_extension()
```

Note that you may want to run `ipython` once so the profile folers are created. If not, just create them manually.

Once everything is in place, the following commands will import all data:

```base
verdi archive import -G ag2se-paper -- ag2se-calcs.aiida
```

As each calculation/workflow is identified based on a unique ID (uuid), the analysis code in the notebook can be reused. 
