function [ U1, U2 ] = controller(state, des_state, params)
%CONTROLLER:  computes the control action for the planar quadrotor
%
% INPUTS:
%   - state: The current state of the quad having:
%       state(1:2) = [y; z]             --- pos 
%       state(5) = [phi]              
% 
% --- vel   
%       state(4:5)  = [y_dot; z_dot]    --- vel
%       state(6) = [phi_dot]            --- phi_dot
%   - des_state: The desired states are:
%       des_state(1:2) = [y; z] 
%       des_state(2:3) = [y_dot; z_dot]
%       des_state(4:6) = [y_ddot; z_ddot]
%   - params: 
%       quad parameters
%
% OUTPUTS:
%   [U1, U2]: the control actions
%
% ----------------------------
% Copyrights Zeyad M. Manaa - April 2023.
% DONE FOR QUAD SINDY PROJECT - AE540.

g = params.gravity;
m = params.mass;
Ixx = params.Ixx;

%%% controller PD gains
% altitude gains
Kvz     = 15; % derrivative gain
Kpz     = 50; % proportional gain

% angle gain
Kvphi   = 20; % derrivative gain
Kpphi   = 80; % proportional gain

% y-position gain
Kvy     = 15; % derrivative gain
Kpy     = 60; % proportional gain

% current state
y       = state(1); 
y_dot   = state(4); 

z       = state(2);
z_dot   = state(5);

phi     = state(3);
phi_dot = state(6);

% desired state
y_des = des_state(1);
y_dot_des = des_state(3); 
y_ddot_des = des_state(5); 

z_des = des_state(2);
z_dot_des = des_state(4);
z_ddot_des = des_state(6);


% PD control equations
phi_c = -(y_ddot_des + Kvy*(y_dot_des - y_dot) + Kpy*(y_des - y))/g;
phi_c_dot = -(Kvy*(y_ddot_des + g*phi) + Kpy*(y_dot_des - y_dot))/g;

U1 = m*(g + z_ddot_des + Kvz*(z_dot_des - z_dot) + Kpz*(z_des - z));
U2 = Ixx*( Kvphi*(phi_c_dot - phi_dot) + Kpphi*(phi_c - phi));

end

