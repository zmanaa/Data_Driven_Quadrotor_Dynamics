% Copyright April, 2023, All Rights Reserved.
% Code by Zeyad M. Manaa.
%
%
% For Paper, "DATA DRIVEN DISCOVERY OF QUADROTOR EQUATIONS OF MOTION VIA
%             SPARSE IDENTIFICATION OF NONLINEAR DYNAMICS" 

clear;
clc; 
close all;

%%% include utilis 
addpath("trajectories/")
addpath("utilis/")


%%% DEFS 
SHOW_PLOT_FLAG = 1;
PLOT_TYPE = 'col'; % all states in one figure
% PLOT_TYPE = 'ind'; % individual figures
FIGURE_EXTENSION = 'eps';  % {'png', 'svg'}
%%% specify traj
TRAJ_TYPE = 'diamond'; %{'step', 'line', 'sine', 'diamond'}

%%% run simulation
[t_out, states_out, ctrl, ref_traj] = simulate_dynamics(TRAJ_TYPE);
[t_out_SINDy, states_out_SINDy, ctrl_SINDy, ref_traj_SINDy] = ...
                                            simulate_SINDy(TRAJ_TYPE);

%%% extract data
all_out = [t_out, states_out, ctrl, ref_traj];
writematrix(all_out,'DATA/all_out_rnd.csv') 


%%% plot scheme
if SHOW_PLOT_FLAG
    plot_data(t_out_SINDy, states_out_SINDy, ...
        t_out, states_out, ref_traj, ctrl, ...
        PLOT_TYPE, TRAJ_TYPE, FIGURE_EXTENSION)
end

