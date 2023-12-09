function [ dstates ] = planar_quad_discovered_eom(time, states, control_action, params)
% planar_quad_discovered_eom: calculate the states derivative for the 
%                               2D quadrtotor    
%
% INPUTS: 
%   - time: time instance
%   - states: the system states [y; z; phi; y_dot; z_dot; phi_dot]
%   - controller_action: [u1, u2]
%                      f1          f2
%                    ------      ------ 
%                      |            |
%                 ------------------------
%                
%                 u1 = Σ_(i=1,2) f_i
%                 u2 = (f1 - f2)*arm_length
%   - controller_handle: handle to the controller function
%   - params: the quad rotor parameters
%
% OUTPUTS:
%   - dstates: the derivative of the states
%
% ----------------------------
% Copyrights Zeyad M. Manaa - April 2023.
% DONE FOR QUAD SINDY PROJECT - AE540.


current_state.pos = states(1:2);
current_state.phi = states(3);
current_state.vel = states(4:5);
current_state.phi_dot = states(6);



u1 = control_action(1);
u2 = control_action(2);

% get forces
f1 = 0.5*(u1 - u2/params.arm_length);
f2 = 0.5*(u1 + u2/params.arm_length);

% check for saturation
f1_saturated = min(max(params.min_force/2, f1), params.max_force/2);
f2_saturated = min(max(params.min_force/2, f2), params.max_force/2);
saturated_u1 = f1_saturated + f2_saturated;
saturated_u2 = (f2_saturated - f1_saturated)*params.arm_length;


dstates = [states(4);
        states(5);
        states(6);
        -5.554*saturated_u1*sin(states(3));
        -9.810 + 5.556*saturated_u1*cos(states(3));
        4000*saturated_u2];

end
