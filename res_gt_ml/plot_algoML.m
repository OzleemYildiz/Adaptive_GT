m = [2,5, 10];

close all
for i=1:3
    for k=1:1
        load('final_n_test_ex_analog_5.mat')
        load('RandiUniform_Updatep_n_test_ex_5_rng2.mat')
        load('RandiUniform_Updatep_n_test_fn_gt_5_rng2.mat')
        load('RandiUniform_Updatep_n_test_Hwang_5_rng2.mat')
        
       
        fig3 = figure;
        plot(15:150, n_test_Hwang(i, 8:143, 1),  '--', 'LineWidth', 2, 'Markersize', 8, 'MarkerIndices', 8:4:143);
        hold on;
        plot(15:150, n_test_fn_gt(i, 8:143, 1),'-+', 'LineWidth', 2,  'Markersize', 8, 'MarkerIndices', 8:4:143);
        hold on;
        plot(15:150, n_test_ex(i, 8:143, 1), '-o', 'LineWidth', 2, 'Markersize', 8, 'MarkerIndices', 8:4:143);
        hold on;
        
        legend('GBS','PGBS (Parallel, $C=2$)','Parallel Individual Testing', 'Location','northwest','Interpreter','latex','FontSize', 18')
%         title("The algorithm comparison for m = " + m + " p_{md}= " + pmd(k)+ " p_{fa}= "+ pfa(k))
%         xlabel('n')
        xlabel('$N$ (Total number of items)','Interpreter','latex','FontSize', 18)
        ylabel('$\tau$ (number of cycles)','Interpreter','latex','FontSize', 18)
        grid on
        grid minor
        axis tight;
        set(gca, 'fontsize',18)
        saveas(fig3,sprintf("parallelcompm%dres.eps",m(i)),'epsc');
        
        
        fig2 = figure;
        plot(15:150, n_test_Hwang(i, 8:143, 1),  '--', 'LineWidth', 2, 'Markersize', 8, 'MarkerIndices', 8:4:143);
        hold on;
        plot(15:150, n_test_ex_analog(i, 8:143, 1), 'm-+', 'LineWidth', 2, 'Markersize', 8, 'MarkerIndices', 8:4:143);
        legend('GBS ','Individual Testing', 'Location','northwest','Interpreter','latex','FontSize', 18')
        xlabel('$N$ (Total number of items)','Interpreter','latex','FontSize', 18)
        ylabel('$\tau$ (number of cycles)','Interpreter','latex','FontSize', 18)
        grid on
        grid minor
        axis tight;
        set(gca, 'fontsize',18)
        saveas(fig2,sprintf("normalcompm%dres.eps",m(i)),'epsc');
        
    end
end