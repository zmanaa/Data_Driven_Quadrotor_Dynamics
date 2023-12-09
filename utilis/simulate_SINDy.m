function [t_out, states_out, ctrl, ref_traj] = simulate_SINDy(traj_type)
% SIMULATE_SINDY: simulating the discovered dynamics for the 2D quadrotor.
%   INPUTS:
%       - traj_type: string defining the desired trajectory
%                       {'line', 'sine', 'step', 'diamond'}
%
% Copyright May, 2023, All Rights Reserved.
% Code by Zeyad M. Manaa.
%

params = get_quad_params;

%%% DEFS

T_TOTAL     = 10;             % Total simulated time
T_STEP      = 0.01;          % This determines the time step at which the solution is given
T_OUT       = 0:T_STEP:T_TOTAL;
TRAJ_TYPE   = traj_type;
NOISE_FLAG  = 0;    

% Make trajectory
traj_indx = 1;
switch TRAJ_TYPE
    case 'step'
        for t = 0:T_STEP:T_TOTAL
            des_states(:,traj_indx) = traj_step(t);
            traj_indx = traj_indx + 1;
        end
    case 'line'
        for t = 0:T_STEP:T_TOTAL
            des_states(:,traj_indx) = traj_line(t);
            traj_indx = traj_indx + 1;
        end
    case 'sine'
        for t = 0:T_STEP:T_TOTAL
            des_states(:,traj_indx) = traj_sine(t);
            traj_indx = traj_indx + 1;
        end
    case 'diamond'
        for t = 0:T_STEP:T_TOTAL
            des_states(:,traj_indx) = traj_diamond(t);
            traj_indx = traj_indx + 1;
        end
end


% initial conditions:
states(:,1) = [des_states(1:2,1);
                0; 
                des_states(3,1);
                des_states(4,1);
                0];


% Run simulation
for i = 1:length(T_OUT)

    if NOISE_FLAG
        states_out(:,i) = states + 0.01*rand(6,1);
    else
        states_out(:,i) = states;
    end
    
    [u1(i), u2(i)] = controller(states, ...
                          des_states(:, i), ...
                          params);

    f = @(time, states) planar_quad_discovered_eom(time, states, [u1(i), u2(i)], params);
    
    k1 = f(T_OUT(i),states);
    k2 = f(T_OUT(i)+T_STEP/2,states+k1*T_STEP/2);
    k3 = f(T_OUT(i)+T_STEP/2,states+k2*T_STEP/2);
    k4 = f(T_OUT(i)+T_STEP,states+k3*T_STEP);
    k = (1/6)*(k1 + 2*k2 + 2*k3 + k4);
    states = states + k*T_STEP;
end


sim_end_time = toc;
states_out = states_out';
t_out = T_OUT';
ref_traj = des_states';
ctrl = [u1', u2'];
end