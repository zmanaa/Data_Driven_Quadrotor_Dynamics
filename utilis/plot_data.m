function plot_data(t_out_SINDy, states_out_SINDy, ...
    t_out, states_out, ref_traj, ...
    ctrl, plot_case, traj_type, ext)
% Copyright April, All Rights Reserved.
% Code by Zeyad M. Manaa.
%

%%% DEFS
FIG_FOLDER_NAME = 'PLANAR_QUAD/';
PATH            = 'SINDY-DMD-Quadrotor/FIGURES/MATLAB_ORIGINAL_NUMERICAL_SIM/';
FIG_PATH        = ['FIGURES/MATLAB_ORIGINAL_NUMERICAL_SIM/' FIG_FOLDER_NAME];
TYPE            = 'PLANAR';
FIGURE_EXT      = ext;
TRAJ_TYPE       = upper(traj_type);
GREY            = [151, 151, 151]/255;
RED             = [218, 0, 0]/255;
%%% Making a directory for figures
if ~exist(PATH, 'dir')
    mkdir(FIG_PATH)
end

switch plot_case
    case 'ind'
        hfig = figure;  % save the figure handle in a variable
        set(hfig,'Position',[100 100 1600/1.5 900/1.5])
        set(hfig,'PaperPositionMode','auto')
        plot(t_out, ref_traj(:,1), ...
            'color', GREY, 'linewidth', 4,...
            'LineStyle','--',...
            'DisplayName','Reference trajectory');
        hold on
        plot(t_out, states_out(:,1), ...
            'color', RED, 'linewidth', 4, ...
            'DisplayName','System response');
        grid on;
        set(gca, 'FontSize',28)
        xlabel('time t [s]')
        ylabel('y [m]')
        legend()
        set(findall(hfig,'-property','Interpreter'), ...
            'Interpreter','latex')
        set(findall(hfig,'-property','Interpreter'), ...
            'Interpreter','latex')
        set(findall(hfig,'-property','TickLabelInterpreter'), ...
            'TickLabelInterpreter','latex')
        set(hfig,'color','w' )

        if strcmp(FIGURE_EXT, 'png')
            print('-dpng', '-painters','-cmyk', '-loose', ...
                [FIG_PATH,'Y_POS_VS_TIME_QUAD_',TYPE, '_', TRAJ_TYPE, '_TRAJ','.png']);
        elseif strcmp(FIGURE_EXT, 'eps')
            print('-depsc', '-vector', '-cmyk','-cmyk', '-loose', ...
                [FIG_PATH,'Y_POS_VS_TIME_QUAD_',TYPE, '_', TRAJ_TYPE, '_TRAJ','.eps']);
        end

        hfig = figure;
        set(hfig,'Position',[100 100 1600/1.5 900/1.5])
        set(hfig,'PaperPositionMode','auto')
        plot(t_out, states_out(:,2), ...
            'color', RED, 'linewidth', 4,...
            'DisplayName','System response');
        hold on
        plot(t_out, ref_traj(:,2), ...
            'linestyle', '--','color', GREY, 'linewidth', 4, ...
            'DisplayName','Reference trajectory');
        grid on;
        set(gca, 'FontSize',28)
        xlabel('time t [s]', 'FontSize',28)
        ylabel('z [m]', 'FontSize',28)
        legend()
        set(findall(hfig,'-property','Interpreter'), ...
            'Interpreter','latex')
        set(findall(hfig,'-property','TickLabelInterpreter'), ...
            'TickLabelInterpreter','latex')
        set(hfig,'color','w' )
        if strcmp(FIGURE_EXT, 'png')
            print('-dpng', '-painters','-cmyk', '-loose', ...
                [FIG_PATH,'Z_POS_VS_TIME_QUAD_',TYPE, '_', TRAJ_TYPE, '_TRAJ','.png']);
        elseif strcmp(FIGURE_EXT, 'eps')
            print('-depsc', '-vector', '-cmyk','-cmyk', '-loose', ...
                [FIG_PATH,'Z_POS_VS_TIME_QUAD_',TYPE, '_', TRAJ_TYPE, '_TRAJ','.eps']);
        end

        hfig = figure;
        set(hfig,'Position',[100 100 1600/1.5 900/1.5])
        set(hfig,'PaperPositionMode','auto')
        plot(ref_traj(:,1), ref_traj(:,2), ...
            'linestyle', '--', 'color', GREY, 'linewidth', 4,...
            'DisplayName','Reference trajectory');
        hold on
        plot(states_out(:,1), states_out(:,2), ...
            'color', RED, 'linewidth', 4,...
            'DisplayName','System response'); % place holder

        grid on;
        set(gca, 'FontSize',28)
        xlabel('y [m]')
        ylabel('z [m]')
        legend()
        axis equal
        set(findall(hfig,'-property','Interpreter'), ...
            'Interpreter','latex')
        set(findall(hfig,'-property','TickLabelInterpreter'), ...
            'TickLabelInterpreter','latex')
        set(hfig,'color','w' )
        if strcmp(FIGURE_EXT, 'png')
            print('-dpng', '-painters','-cmyk', '-loose', ...
                [FIG_PATH,'PHASE_PLANE_QUAD_',TYPE, '_', TRAJ_TYPE, '_TRAJ','.png']);
        elseif strcmp(FIGURE_EXT, 'eps')
            print('-depsc', '-vector', '-cmyk','-cmyk', '-loose', ...
                [FIG_PATH,'PHASE_PLANE_QUAD_',TYPE, '_', TRAJ_TYPE, '_TRAJ','.eps']);
        end

        hfig = figure;
        set(hfig,'Position',[100 100 1600/1.5 900/1.5])
        set(hfig,'PaperPositionMode','auto')
        plot(t_out, states_out(:,3), ...
            'color', RED,...
            'linewidth', 4,...
            'DisplayName','$\phi$');
        grid on;
        xlabel('time t [s]')
        ylabel('$\phi$')
        axis equal
        set(gca, 'FontSize',28)
        set(findall(hfig,'-property','Interpreter'), ...
            'Interpreter','latex')
        set(findall(hfig,'-property','TickLabelInterpreter'), ...
            'TickLabelInterpreter','latex')
        set(hfig,'color','w' )
        if strcmp(FIGURE_EXT, 'png')
            print('-dpng', '-painters','-cmyk', '-loose', ...
                [FIG_PATH,'PHI_VS_TIME_QUAD_',TYPE, '_', TRAJ_TYPE, '_TRAJ','.png']);
        elseif strcmp(FIGURE_EXT, 'eps')
            print('-depsc', '-vector', '-cmyk','-cmyk', '-loose', ...
                [FIG_PATH,'PHI_VS_TIME_QUAD_',TYPE, '_', TRAJ_TYPE, '_TRAJ','.eps']);
        end

        hfig = figure;
        set(hfig,'Position',[100 100 1600/1.5 900/1.5])
        set(hfig,'PaperPositionMode','auto')
        plot(t_out, ctrl(:,1), ...
            'color', RED,...
            'linewidth', 4,...
            'DisplayName','Control actuation $u_1$');
        grid on;
        xlabel('time t [s]')
        ylabel('$u_1$')
        axis equal
        set(findall(hfig,'-property','Interpreter'), ...
            'Interpreter','latex')
        set(findall(hfig,'-property','TickLabelInterpreter'), ...
            'TickLabelInterpreter','latex')
        set(hfig,'color','w' )
        set(gca, 'FontSize',28)
        if strcmp(FIGURE_EXT, 'png')
            print('-dpng', '-painters','-cmyk', '-loose', ...
                [FIG_PATH,'U1_VS_TIME_QUAD_',TYPE, '_', TRAJ_TYPE, '_TRAJ','.png']);
        elseif strcmp(FIGURE_EXT, 'eps')
            print('-depsc', '-vector', '-cmyk','-cmyk', '-loose', ...
                [FIG_PATH,'U1_VS_TIME_QUAD_',TYPE, '_', TRAJ_TYPE, '_TRAJ','.eps']);
        end

        hfig = figure;
        set(hfig,'Position',[100 100 1600/1.5 900/1.5])
        set(hfig,'PaperPositionMode','auto')
        plot(t_out, ctrl(:,2), ...
            'color', RED,...
            'linewidth', 4,...
            'DisplayName','$u_2$');
        grid on;
        xlabel('time t [s]')
        ylabel('$u_2$')
        axis equal
        set(gca, 'FontSize',28)
        set(findall(hfig,'-property','Interpreter'), ...
            'Interpreter','latex')
        set(findall(hfig,'-property','TickLabelInterpreter'), ...
            'TickLabelInterpreter','latex')
        set(hfig,'color','w' )
        if strcmp(FIGURE_EXT, 'png')
            print('-dpng', '-painters','-cmyk', '-loose', ...
                [FIG_PATH,'U2_VS_TIME_QUAD_',TYPE, '_', TRAJ_TYPE, '_TRAJ','.png']);
        elseif strcmp(FIGURE_EXT, 'eps')
            print('-depsc', '-vector', '-cmyk','-cmyk', '-loose', ...
                [FIG_PATH,'U3_VS_TIME_QUAD_',TYPE, '_', TRAJ_TYPE, '_TRAJ','.eps']);
        end

    case 'col'
        hfig = figure;

        % Set figure properties
        set(hfig,'Position',[100 100 1600/1.5 900/1.5]);
        set(hfig,'PaperPositionMode','auto');

        % Set axis properties
        set(gca,'LineWidth',2, 'FontSize',28, 'FontWeight', 'bold');

        % Plot trajectories in first subplot
        subplot(2,2,1)
        plot(states_out(:,1), states_out(:,2), ...
            'DisplayName','System response', 'LineWidth',4);
        hold on
        plot(ref_traj(:,1), ref_traj(:,2), ...
            'linestyle', '--', ...
            'DisplayName','Reference trajectory', 'LineWidth',4);
        xlabel('y [m]', 'FontSize',28, 'FontWeight', 'bold')
        ylabel('z [m]', 'FontSize',28, 'FontWeight', 'bold')
        grid on

        % Plot y position vs time in second subplot
        subplot(2,2,2)
        plot(t_out, states_out(:,1), ...
            'DisplayName','System response', 'LineWidth',4);
        hold on
        plot(t_out, ref_traj(:,1), ...
            'linestyle', '--',...
            'DisplayName','Reference trajectory', 'LineWidth',4);
        xlabel('time t [s]', 'FontSize',28)
        legend('Orientation','vertical','Box','on','Location','south')

        ylabel('y [m]', 'FontSize',28)
        grid on;

        % Plot z position vs time in third subplot
        subplot(2,2,3)
        plot(t_out, states_out(:,2), ...
            'DisplayName','System response', 'LineWidth',4);
        hold on
        plot(t_out, ref_traj(:,2), ...
            'linestyle', '--',...
            'DisplayName','Reference trajectory', 'LineWidth',4);
        grid on;
        xlabel('time t [s]', 'FontSize',28)
        ylabel('z [m]', 'FontSize',28)

        % Plot angle vs time in fourth subplot
        subplot(2,2,4)
        plot(t_out, states_out(:,3), ...
            'DisplayName','System response', 'LineWidth',4);
        hold on;
        %plot(t_out, ref_traj(:,3), ...
        %    'linestyle', '--',...
        %    'DisplayName','Reference trajectory', 'LineWidth',2);
        grid on;
        xlabel('time t [s]', 'FontSize',28)
        ylabel('$\phi$ [rad]', 'FontSize',28)

        % Set font properties
        set(findall(hfig,'-property','FontSize'),'FontSize',28)
        set(findall(hfig,'-property','Interpreter'),'Interpreter','latex')
        set(findall(hfig,'-property','TickLabelInterpreter'),...
            'TickLabelInterpreter','latex')

        % Set figure color
        set(hfig,'PaperPositionMode','Auto' );
        set(hfig,'color','w' );

        if strcmp(FIGURE_EXT, 'png')
            print('-dpng', '-painters','-cmyk', '-loose', ...
                [FIG_PATH,'COLLECTIVE_GRAPH_QUAD_',TYPE, '_', TRAJ_TYPE, '_TRAJ','.png']);
        elseif strcmp(FIGURE_EXT, 'eps')
            print('-depsc', '-vector', '-cmyk', ...
                [FIG_PATH,'COLLECTIVE_GRAPH_QUAD_',TYPE, '_', TRAJ_TYPE, '_TRAJ','.eps']);
        end
end

%%% Compare SINDy and ground truth
hfig = figure;  % save the figure handle in a variable
set(hfig,'Position',[100 100 1600/1.5 900/1.5])
set(hfig,'PaperPositionMode','auto')
set(hfig, 'color', 'w')

ax(1) = subplot(2,2,1);
plot(states_out(:,1), states_out(:,2), 'color', GREY, 'linewidth', 4);
hold on
plot(states_out_SINDy(:,1), states_out_SINDy(:,2), 'linestyle', '--', 'color', RED, 'linewidth', 4);
grid on
xlabel('y position [m]', 'FontSize',28, 'FontWeight', 'bold')
ylabel('z position [m]', 'FontSize',28, 'FontWeight', 'bold')

% Subplot 2
ax(2) = subplot(2,2,2);
plot(t_out, states_out(:,1), 'color', GREY, ...
    'linewidth', 4, ...
    'DisplayName','Original dynamics');
hold on
plot(t_out_SINDy, states_out_SINDy(:,1), ...
    'linestyle', '--', 'color', RED, ...
    'linewidth', 4, ...
    'DisplayName','SINDy predection');
grid on
xlabel('time t [s]', 'FontSize',28)
ylabel('y position [m]', 'FontSize',28)

Lgnd = legend('show', 'Orientation','vertical', ...
    'Location','best');

% Subplot 3
ax(3) = subplot(2,2,3);
plot(t_out, states_out(:,2), 'color', GREY, 'linewidth', 4);
hold on
plot(t_out_SINDy, states_out_SINDy(:,2), 'linestyle', '--', 'color', RED, 'linewidth', 4);
grid on
xlabel('time t [s]', 'FontSize',28)
ylabel('z position [m]', 'FontSize',28)

% Subplot 4
ax(4) = subplot(2,2,4);
plot(t_out, states_out(:,3), ...
    'color', GREY, 'linewidth', 4);
hold on
plot(t_out_SINDy, states_out_SINDy(:,3), ...
    'color', RED, 'linewidth', 4,'linestyle', '--');
grid on
xlabel('time t [s]', 'FontSize',28)
ylabel('$\phi$ [rad]', 'FontSize',28)

set(findall(hfig,'-property','FontSize'),'FontSize',28)
set(findall(hfig,'-property','Interpreter'), ...
    'Interpreter','latex')
set(findall(hfig,'-property','TickLabelInterpreter'), ...
    'TickLabelInterpreter','latex')
set(hfig,'PaperPositionMode','Auto' )

if strcmp(FIGURE_EXT, 'png')
    print('-dpng', '-painters','-cmyk', '-loose', ...
        [FIG_PATH,'COMPARISON_',TYPE, '_', TRAJ_TYPE, '_TRAJ','.png']);
elseif strcmp(FIGURE_EXT, 'eps')
    print('-depsc', '-vector', '-cmyk', ...
        [FIG_PATH,'COMPARISON_',TYPE, '_', TRAJ_TYPE, '_TRAJ','.eps']);
end



%%% Error plot
hfig = figure;  % save the figure handle in a variable
set(hfig,'Position',[100 100 1600/1.5 900/1.5])
set(hfig,'PaperPositionMode','auto')

error = abs(states_out_SINDy - states_out);
semilogy(t_out, error, ...
    'linewidth', 4,...
    'DisplayName','Original dynamics');
ax = gca;
ax.YGrid = 'on';
ax.YMinorGrid = 'on';
set(ax,'YMinorTick','on')
xlabel('time [s]', 'FontSize',28, 'FontWeight', 'bold')
ylabel('Error', 'FontSize',28, 'FontWeight', 'bold')
axis tight

set(gca, 'FontSize',28)
set(findall(hfig,'-property','Interpreter'), ...
    'Interpreter','latex')
set(findall(hfig,'-property','Interpreter'), ...
    'Interpreter','latex')
set(findall(hfig,'-property','TickLabelInterpreter'), ...
    'TickLabelInterpreter','latex')
set(hfig,'color','w' )
legend('$\hat{y}$','$\hat{z}$','$\hat{\phi}$','$\hat{\dot{y}}$','$\hat{\dot{z}}$','$\hat{\dot{\phi}}$', ...
    'Location','southwest', 'Box', 'on', ...
    'interpreter', 'latex', 'FontSize',28)
if strcmp(FIGURE_EXT, 'png')
    print('-dpng', '-painters','-cmyk', '-loose', ...
        [FIG_PATH,'ERROR_',TYPE, '_', TRAJ_TYPE, '_TRAJ','.png']);
elseif strcmp(FIGURE_EXT, 'eps')
    print('-depsc', '-vector', '-cmyk', ...
        [FIG_PATH,'ERROR_',TYPE, '_', TRAJ_TYPE, '_TRAJ','.eps']);
end
