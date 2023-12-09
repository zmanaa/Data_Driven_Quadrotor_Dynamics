function [ params ] = get_quad_params()
% get_quad_params: Returns system parameters

params.gravity = 9.81;
params.mass = 0.18;
params.Ixx = 0.00025;
params.arm_length = 0.086;
params.min_force = 0;
params.max_force = 2*params.mass*params.gravity;

end