# SINDY-DMD Quadrotor
This a repository for "__DATA DRIVEN DISCOVERY OF QUADROTOR EQUATIONS OF MOTION USING SPARSE IDENTIFICATION OF NONLINEAR DYNAMICS AND DYNAMIC MODE DECOMPOSITION ALGORITHMS__" Project for AE540 course.

We apply the recent sparse identification of nonlinear dynamics (SINDy) [arXiv](https://arxiv.org/abs/1509.03580) to discover the quadrotor governing equation from numerical simulation data.

## Current Status:
- [x] Quad Simulation 
  - [x] 2D Planar Quad simulation
  - [x] Equation of Motion Implementation.
  - [x] PD Controller.
  - [ ] Full 3D Quad Simulation
- [ ] SINDy with Control System Discovery 
  - [x] SINDy Model Implementation.
  - [x] SINDy Model Validation 
  - [x] SINDy Model with Planar Quad.
- [ ] Dynamic Mode Decomposition (DMD) with Control.
  - [x] DMD Model Implementation
  - [x] DMD Validation
  - [ ] DMD with Planar Quad.

## Installation
### For Planar Quadrotor Simulation:
1. run the _main.m_ file.
2. The data can be found in DATA FOR SINDY floder.
### For SINDy Trainer:
1. Dependinces
  - Pyhton3
    - For Windows: https://www.python.org/downloads/release/python-3113/
    - For macOS: https://www.python.org/downloads/macos/ 
  - ``numpy`` - ``pip3 install numpy``
  - ``pandas`` - ``pip3 install pandas``
  - ``pysindy`` - ``pip3 install pysindy`` 
  - ``matplotlib`` - ``pip3 install matplotlib``
2. Open Sindy_training.ipynb folder and run to get the model.

