function calc_pi()
    n=5000;
    r=1;
    [pi_priblizek, napaka] = area_pi(n);
    disp('Koordinate točk znotraj kroga in znotraj kvadrata v vektorski obliki: odstrani %komentar')
    %[znotraj_kroga, znotraj_kvadrata] = mcc_pi(n)
    disp(['Približek števila pi:', num2str(pi_priblizek)])
    disp(['Odstopanje:', num2str(napaka)])
    figure(n)
end



function figure(n)
     x = rand(1,n);
     y = rand(1,n);
     radij = sqrt(x.^2 + y.^2);  
     znotraj_kroga = radij <= 1;

    
     scatter(x(znotraj_kroga), y(znotraj_kroga), 10, 'r', 'filled');  
     hold on;
     scatter(x(~znotraj_kroga), y(~znotraj_kroga), 10, 'b', 'filled'); 
     hold off;

    theta = linspace(0, pi/2, 100);  % 100 točk za izris krožnice
    r = 1;  % Radij krožnice
    x_circle = r * cos(theta);
    y_circle = r * sin(theta);
    
    hold on;
    plot(x_circle, y_circle, 'y', 'LineWidth', 2);  % Izris loka krožnice (zeleno)
    hold off;
end


function [pi_priblizek, napaka] = area_pi(n)     
   zunaj=0;
   notri=0;
   na_kroznici=@(t) [cos(t);sin(t)];
   t=rand(0:pi/2);
    for i=1:n
        x = rand();
        y = rand();
        znotri=2*pi*rand();
         tocka_na_kroznici=[na_kroznici(znotri)];
         tocke_kroznice(:,i) = tocka_na_kroznici;
         tocke_kvadrata(:,i) = [x;y;];
            if (x^2+y^2)<=1
                notri=notri+1;
            else
                zunaj=zunaj+1;
            end
    end
  pi_priblizek=4*notri/n;
  napaka=abs(pi_priblizek-pi);
end
