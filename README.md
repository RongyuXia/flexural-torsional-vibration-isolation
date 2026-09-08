# JSV Open-Source Code and Models

This repository contains the MATLAB plotting scripts, numerical data, and COMSOL Multiphysics models associated with the paper *Flexural and torsional vibration isolation of pipe by adaptive locally resonant piezoelectric array*. The study investigates flexural and torsional wave control in a pipe structure using negative-capacitance (NC) shunted piezoelectric resonators.

## Software Requirements

- **MATLAB** (tested with R2024b; earlier releases that support `importdata` and `saveas` should also work)
- **COMSOL Multiphysics 6.0** (the simulation models were built with version 6.0; the `.mph` model files can be regenerated from the exported MATLAB model files described below)

## Repository Structure

```
JSV_开源/
├── MATLAB/
│   ├── fig02_effective_youngs_modulus.m
│   ├── fig03_flexural_reaction_force.m
│   ├── fig04_effective_shear_modulus.m
│   ├── fig05_torsional_reaction_force.m
│   ├── fig06_flexural_band_structure.m
│   ├── fig07_flexural_bandgap_vs_gamma.m
│   ├── fig07_flexural_bandgap_data.txt
│   ├── fig08_torsional_band_structure.m
│   ├── fig09_torsional_bandgap_vs_gamma.m
│   ├── fig09_torsional_bandgap_data.txt
│   ├── fig12_flexural_transmission.m
│   ├── fig12_flexural_transmission_nc.txt
│   ├── fig12_flexural_transmission_sc.txt
│   ├── fig13_torsional_transmission.m
│   ├── fig13_torsional_transmission_nc.txt
│   ├── fig13_torsional_transmission_sc.txt
│   ├── flexural_NC.m
│   ├── flexural_SC.m
│   ├── torsional_NC.m
│   └── torsional_SC.m
└── README.md
```

## Figure-to-File Mapping

| Paper figure | File(s) | Reproduction method |
|---|---|---|
| Fig. 2 | `fig02_effective_youngs_modulus.m` | MATLAB calculation and plotting |
| Fig. 3 | `fig03_flexural_reaction_force.m` | MATLAB calculation and plotting |
| Fig. 4 | `fig04_effective_shear_modulus.m` | MATLAB calculation and plotting |
| Fig. 5 | `fig05_torsional_reaction_force.m` | MATLAB calculation and plotting |
| Fig. 6 | `fig06_flexural_band_structure.m` | MATLAB theoretical band-structure calculation |
| Fig. 7 | `fig07_flexural_bandgap_vs_gamma.m` + `fig07_flexural_bandgap_data.txt` | MATLAB plotting of data obtained from the Fig. 6 theoretical calculation |
| Fig. 8 | `fig08_torsional_band_structure.m` | MATLAB theoretical band-structure calculation |
| Fig. 9 | `fig09_torsional_bandgap_vs_gamma.m` + `fig09_torsional_bandgap_data.txt` | MATLAB plotting of data obtained from the Fig. 8 theoretical calculation |
| Fig. 10 | `flexural_SC.m`, `flexural_NC.m`, `torsional_SC.m`, `torsional_NC.m` | COMSOL geometry result, obtained by rebuilding the models from the exported MATLAB model files |
| Fig. 11 | `flexural_SC.m`, `flexural_NC.m`, `torsional_SC.m`, `torsional_NC.m` | COMSOL mesh result, obtained by rebuilding the models from the exported MATLAB model files |
| Fig. 12 | `fig12_flexural_transmission.m` + `fig12_flexural_transmission_nc.txt` + `fig12_flexural_transmission_sc.txt` | COMSOL transmission data plotted by MATLAB |
| Fig. 13 | `fig13_torsional_transmission.m` + `fig13_torsional_transmission_nc.txt` + `fig13_torsional_transmission_sc.txt` | COMSOL transmission data plotted by MATLAB |
| Fig. 14 | `flexural_SC.m`, `flexural_NC.m` | COMSOL flexural-wave field result, obtained by rebuilding the models from the exported MATLAB model files |
| Fig. 15 | `torsional_SC.m`, `torsional_NC.m` | COMSOL torsional-wave field result, obtained by rebuilding the models from the exported MATLAB model files |

## Data and Model Provenance

The MATLAB and COMSOL components are connected as follows:

1. `fig06_flexural_band_structure.m` implements the flexural-wave theoretical band-structure calculation. The resulting bandgap boundaries are supplied in `fig07_flexural_bandgap_data.txt` and rendered by `fig07_flexural_bandgap_vs_gamma.m`.
2. `fig08_torsional_band_structure.m` implements the torsional-wave theoretical band-structure calculation. The resulting bandgap boundaries are supplied in `fig09_torsional_bandgap_data.txt` and rendered by `fig09_torsional_bandgap_vs_gamma.m`.
3. The short-circuit and NC models, `flexural_SC.m` and `flexural_NC.m`, are the MATLAB model files exported from the corresponding COMSOL models; the models can be rebuilt in COMSOL from these files, and they generated the transmission data in `fig12_flexural_transmission_sc.txt` and `fig12_flexural_transmission_nc.txt`, respectively.
4. The short-circuit and NC models, `torsional_SC.m` and `torsional_NC.m`, are the MATLAB model files exported from the corresponding COMSOL models; the models can be rebuilt in COMSOL from these files, and they generated the transmission data in `fig13_torsional_transmission_sc.txt` and `fig13_torsional_transmission_nc.txt`, respectively.
5. `flexural_NC.m`, `flexural_SC.m`, `torsional_NC.m`, and `torsional_SC.m` are MATLAB model files exported from COMSOL. Running them in COMSOL/MATLAB regenerates the `.mph` source models. They are also retained for MATLAB MCP invocation and model-link integration; they are not the plotting scripts used for Figs. 2--13.

## Running the MATLAB Scripts

Run a script from MATLAB, for example:

```matlab
run("MATLAB/fig12_flexural_transmission.m")
```

Scripts requiring TXT input resolve it relative to their own location, so their data loading does not depend on the MATLAB current working directory. Each script writes its SVG output to the `MATLAB/` directory. Fig. 6 and Fig. 8 each generate separate real- and imaginary-wavenumber SVG files; every other script generates one SVG file.

SVG files are runtime outputs and are not retained in this repository. Remove generated SVG files before committing or packaging the repository.

## TXT Data File Column Definitions

- `fig07_flexural_bandgap_data.txt` and `fig09_torsional_bandgap_data.txt`:
  - Column 1: negative-capacitance parameter
  - Column 2: bandgap lower bound (kHz)
  - Column 3: bandgap upper bound (kHz)
- `fig12_flexural_transmission_*.txt` and `fig13_torsional_transmission_*.txt`:
  - Column 1: frequency (kHz)
  - Column 2: transmission

The `_nc` and `_sc` suffixes denote negative-capacitance and short-circuit shunt cases, respectively.

## Exported COMSOL MATLAB Model Files

The simulation models were built with **COMSOL Multiphysics 6.0**. The four `.m` files in `MATLAB/` (`flexural_SC.m`, `flexural_NC.m`, `torsional_SC.m`, and `torsional_NC.m`) were exported by **COMSOL Multiphysics 6.4**. Running them in COMSOL/MATLAB regenerates the `.mph` source models, from which the geometry, mesh, study settings, and results can be inspected. They can also be used as MATLAB MCP model links.

## License

No license statement is provided at this time.
